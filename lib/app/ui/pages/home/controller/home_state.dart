import 'package:app_transport/app/domain/models/place.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeState {
  final bool loading, gpsEnabled;
  final Map<MarkerId, Marker> markers;
  final Map<PolylineId, Polyline> polylines;
  final LatLng? initialPosition;
  final Place? origin, destination;

  HomeState({
    required this.loading,
    required this.gpsEnabled,
    required this.markers,
    required this.polylines,
    required this.initialPosition,
    required this.origin,
    required this.destination,
  });

  static HomeState get initialState => HomeState(
        loading: true,
        gpsEnabled: false,
        markers: {},
        polylines: {},
        initialPosition: null,
        origin: null,
        destination: null,
      );

  HomeState copyWhith({
    bool? loading,
    bool? gpsEnabled,
    Map<MarkerId, Marker>? markers,
    Map<PolylineId, Polyline>? polylines,
    LatLng? initialPosition,
    Place? origin,
    Place? destination,
  }) {
    return HomeState(
      loading: loading ?? this.loading,
      gpsEnabled: gpsEnabled ?? this.gpsEnabled,
      markers: markers ?? this.markers,
      polylines: polylines ?? this.polylines,
      initialPosition: initialPosition ?? this.initialPosition,
      origin: origin ?? this.origin,
      destination: destination ?? this.destination,
    );
  }

  HomeState clrearOriginAndDestination() {
    return HomeState(
      loading: loading,
      gpsEnabled: gpsEnabled,
      markers: {},
      polylines: {},
      initialPosition: initialPosition,
      origin: null,
      destination: null,
    );
  }
}
