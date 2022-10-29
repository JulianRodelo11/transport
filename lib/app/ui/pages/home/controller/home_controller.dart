import 'dart:async';
import 'package:app_transport/app/data/providers/local/geolocator_wrapper.dart';
import 'package:app_transport/app/domain/models/place.dart';
import 'package:app_transport/app/domain/repositories/routes_repository.dart';
import 'package:app_transport/app/helpers/current_position.dart';
import 'package:app_transport/app/ui/pages/home/controller/utils/set_route.dart';
import 'package:app_transport/app/ui/pages/home/widgets/circle_marker.dart';
import 'package:app_transport/app/ui/utils/fit_map.dart';
import 'package:flutter/widgets.dart' show ChangeNotifier;
import 'package:app_transport/app/ui/utils/map_style.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'home_state.dart';

class HomeController extends ChangeNotifier {
  HomeState _state = HomeState.initialState;
  HomeState get state => _state;

  StreamSubscription? _gpsSubscription, _positionSubscription;
  GoogleMapController? _mapController;
  final GeolocatorWrapper _geolocator;
  final RouteRepository _routeRepository;

  BitmapDescriptor? _dotMarker;

  HomeController(this._geolocator, this._routeRepository) {
    _init();
  }

  Future<void> _init() async {
    final gpsEnabled = await _geolocator.isLocationServiceEnabled;
    _state = state.copyWhith(gpsEnabled: gpsEnabled);

    _gpsSubscription = _geolocator.onServiceEnabled.listen(
      (enabled) {
        _state = state.copyWhith(gpsEnabled: enabled);
        notifyListeners();
      },
    );
    _initLocationUpdates();
    _dotMarker = await getDotMarker();
  }

  Future<void> _initLocationUpdates() async {
    bool initialized = false;

    _positionSubscription = _geolocator.onLocationUpdates.listen(
      (position) {
        if (!initialized) {
          _setInitialPosition(position);
          initialized = true;
          notifyListeners();
        }
        CurrentPosition.i.setValue(
          LatLng(position.latitude, position.longitude),
        );
      },
    );
  }

  void _setInitialPosition(Position position) {
    if (state.gpsEnabled && state.initialPosition == null) {
      _state = state.copyWhith(
        initialPosition: LatLng(
          position.latitude,
          position.longitude,
        ),
        loading: false,
      );
    }
  }

  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(mapStyle);
    _mapController = controller;
  }

  void setOriginAndDestination(Place origin, Place destination) async {
    final routes = await _routeRepository.get(
      origin: origin.position,
      destination: destination.position,
    );

    if (routes != null && routes.isNotEmpty) {
      _state = await setRouteAndMarkers(
          state: state,
          routes: routes,
          origin: origin,
          destination: destination,
          dot: _dotMarker!);

      await _mapController?.animateCamera(
        fitMap(
          origin.position,
          destination.position,
          padding: 65,
        ),
      );
      notifyListeners();
    }
  }

  Future<void> turnOnGPS() => _geolocator.openLocationSettings();

  void clearData() {
    _state = _state.clrearOriginAndDestination();
    notifyListeners();
  }

  @override
  void dispose() {
    _positionSubscription?.cancel();
    _gpsSubscription?.cancel();
    super.dispose();
  }
}
