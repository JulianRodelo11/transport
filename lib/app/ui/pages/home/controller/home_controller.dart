import 'dart:async';
import 'package:app_transport/app/data/providers/local/geolocator_wrapper.dart';
import 'package:app_transport/app/domain/models/place.dart';
import 'package:app_transport/app/domain/repositories/background_location_repository.dart';
import 'package:app_transport/app/domain/repositories/reverse_geocode_repository.dart';
import 'package:app_transport/app/domain/repositories/routes_repository.dart';
import 'package:app_transport/app/helpers/current_position.dart';
import 'package:app_transport/app/ui/pages/home/controller/utils/set_route.dart';
import 'package:app_transport/app/ui/pages/home/widgets/circle_marker.dart';
import 'package:app_transport/app/utils/fit_map.dart';
import 'package:app_transport/app/utils/map_style.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'home_state.dart';

class HomeController extends StateNotifier<HomeState> {
  StreamSubscription? _gpsSubscription, _postionSubscription;
  GoogleMapController? _mapController;

  final _geolocator = Get.i.find<GeolocatorWrapper>();
  final _routesRepository = Get.i.find<RoutesRepository>();
  final _reverseGeocodeRepository = Get.i.find<ReverseGeocodeRepository>();
  final _backgroundLocationRepository =
      Get.i.find<BackgroundLocationRepository>();

  BitmapDescriptor? _dotMarker;
  LatLng? _cameraPosition;

  HomeController() : super(HomeState.initialState) {
    _init();
  }

  bool get originAndDestinationReady =>
      state.origin != null && state.destination != null;

  Future<void> _init() async {
    final gpsEnabled = await _geolocator.isLocationServiceEnabled;
    state = state.copyWith(gpsEnabled: gpsEnabled);

    _gpsSubscription = _geolocator.onServiceEnabled.listen(
      (enabled) {
        state = state.copyWith(gpsEnabled: enabled);
      },
    );

    _initLocationUpdates();
    _dotMarker = await getDotMarker();
  }

  Future<void> _initLocationUpdates() async {
    bool initialized = false;
    _backgroundLocationRepository.startForegroundService();

    _postionSubscription = _geolocator.onLocationUpdates.listen(
      (position) {
        if (!initialized) {
          _setInitialPosition(position);
          initialized = true;
        }
        CurrentPosition.i.setValue(
          LatLng(position.latitude, position.longitude),
        );
      },
    );
  }

  void _setInitialPosition(Position position) {
    if (state.gpsEnabled && state.initialPosition == null) {
      state = state.copyWith(
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
    final cameraUpdate = CameraUpdate.newLatLng(CurrentPosition.i.value!);
    _mapController!.moveCamera(cameraUpdate);
  }

  void setOriginAndDestination(Place origin, Place destination) async {
    if (originAndDestinationReady) {
      clearData(true);
    } else {
      state = state.copyWith(
        fetching: true,
      );
    }

    final routes = await _routesRepository.get(
      origin: origin.position,
      destination: destination.position,
    );

    if (routes != null && routes.isNotEmpty) {
      await _mapController?.animateCamera(
        fitMap(
          origin.position,
          destination.position,
          padding: 35,
        ),
      );
      state = await setRouteAndMarkers(
        state: state,
        routes: routes,
        origin: origin,
        destination: destination,
        dot: _dotMarker!,
      );
    } else {
      state = state.copyWith(
        fetching: false,
      );
    }
  }

  Future<void> confirmOriginOrDestination() async {
    state = state.confirmOriginOrDestination();
    if (originAndDestinationReady) {
      setOriginAndDestination(
        state.origin!,
        state.destination!,
      );
    }
    // goToSearch();
    // final zoom = await _mapController!.getZoomLevel();
    // final cameraUpdate = CameraUpdate.newLatLngZoom(
    //   CurrentPosition.i.value!,
    //   zoom < 15.9 ? 15.9 : zoom,
    // );
    // return _mapController!.animateCamera(cameraUpdate);
  }

  Future<void> exchange() async {
    final origin = state.destination!;
    final destination = state.origin!;
    clearData();
    return setOriginAndDestination(origin, destination);
  }

  Future<void> turnOnGPS() => _geolocator.openLocationSettings();

  Future<void> clearData([bool fetching = false]) async {
    state = state.clearOriginAndDestination(fetching);
    final zoom = await _mapController!.getZoomLevel();
    final cameraUpdate = CameraUpdate.newLatLngZoom(
      CurrentPosition.i.value!,
      zoom < 15.9 ? 15.9 : zoom,
    );
    return _mapController!.animateCamera(cameraUpdate);
  }

  void pickFromMap(bool isOrigin) {
    state = state.setPickFromMap(isOrigin);
  }

  Future<void> cancelPickFromMap() async {
    state = state.cancelPickFromMap();

    final zoom = await _mapController!.getZoomLevel();
    final cameraUpdate = CameraUpdate.newLatLngZoom(
      CurrentPosition.i.value!,
      zoom < 15.9 ? 15.9 : zoom,
    );
    return _mapController!.animateCamera(cameraUpdate);
  }

  Future<void> goToMyPosition() async {
    final zoom = await _mapController!.getZoomLevel();
    final cameraUpdate = CameraUpdate.newLatLngZoom(
      CurrentPosition.i.value!,
      zoom < 15.9 ? 15.9 : zoom,
    );
    return _mapController!.animateCamera(cameraUpdate);
  }

  void onCameraMoveStarted() {
    if (state.pickFromMap != null) {
      state = state.copyWith(
        pickFromMap: state.pickFromMap!.copyWith(
          dragging: true,
        ),
      );
    }
  }

  void onCameraMove(CameraPosition cameraPosition) {
    _cameraPosition = cameraPosition.target;
  }

  void onCameraIdle() async {
    if (state.pickFromMap != null && _cameraPosition != null) {
      final place = await _reverseGeocodeRepository.parse(
        _cameraPosition!,
      );

      state = state.copyWith(
        pickFromMap: state.pickFromMap!.copyWith(
          dragging: false,
          place: place,
        ),
      );
    }
  }

  @override
  void dispose() {
    _postionSubscription?.cancel();
    _gpsSubscription?.cancel();
    _reverseGeocodeRepository.cancel();
    _mapController?.dispose();
    _backgroundLocationRepository.stopForegroundService();
    super.dispose();
  }
}
