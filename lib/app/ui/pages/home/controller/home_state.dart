import 'package:app_transport/app/domain/models/place.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeState {
  final bool loading, gpsEnabled, fetching;
  final Map<MarkerId, Marker> markers;
  final Map<PolylineId, Polyline> polylines;
  final LatLng? initialPosition;
  final Place? origin, destination;
  final PickFromMap? pickFromMap;

  HomeState({
    required this.loading,
    required this.gpsEnabled,
    required this.markers,
    required this.polylines,
    required this.initialPosition,
    required this.origin,
    required this.destination,
    required this.fetching,
    required this.pickFromMap,
  });

  static HomeState get initialState => HomeState(
        loading: true,
        gpsEnabled: false,
        markers: {},
        polylines: {},
        initialPosition: null,
        origin: null,
        destination: null,
        fetching: false,
        pickFromMap: null,
      );

  HomeState copyWhith({
    bool? loading,
    bool? gpsEnabled,
    bool? fetching,
    Map<MarkerId, Marker>? markers,
    Map<PolylineId, Polyline>? polylines,
    LatLng? initialPosition,
    Place? origin,
    Place? destination,
    PickFromMap? pickFromMap,
  }) {
    return HomeState(
      pickFromMap: pickFromMap ?? this.pickFromMap,
      fetching: fetching ?? this.fetching,
      loading: loading ?? this.loading,
      gpsEnabled: gpsEnabled ?? this.gpsEnabled,
      markers: markers ?? this.markers,
      polylines: polylines ?? this.polylines,
      initialPosition: initialPosition ?? this.initialPosition,
      origin: origin ?? this.origin,
      destination: destination ?? this.destination,
    );
  }

  HomeState clrearOriginAndDestination(bool fetching) {
    return HomeState(
      pickFromMap: null,
      fetching: fetching,
      loading: loading,
      gpsEnabled: gpsEnabled,
      markers: {},
      polylines: {},
      initialPosition: initialPosition,
      origin: null,
      destination: null,
    );
  }

  HomeState cancelPickFromMap() {
    final prevData = pickFromMap!;
    return HomeState(
      pickFromMap: null,
      fetching: fetching,
      loading: loading,
      gpsEnabled: gpsEnabled,
      markers: prevData.markers,
      polylines: prevData.polylines,
      initialPosition: initialPosition,
      origin: prevData.origin,
      destination: prevData.destination,
    );
  }

  HomeState setPickFromMap(bool isOrigin) {
    return HomeState(
      pickFromMap: PickFromMap(
        isOrigin,
        place: null,
        origin: origin,
        destination: destination,
        markers: markers,
        polylines: polylines,
      ),
      markers: {},
      polylines: {},
      origin: null,
      destination: null,
      loading: loading,
      fetching: fetching,
      gpsEnabled: gpsEnabled,
      initialPosition: initialPosition,
    );
  }
}

class PickFromMap {
  final Place? place, origin, destination;
  final bool isOrigin;
  final Map<MarkerId, Marker> markers;
  final Map<PolylineId, Polyline> polylines;

  PickFromMap(
    this.isOrigin, {
    required this.place,
    required this.origin,
    required this.destination,
    required this.markers,
    required this.polylines,
  });
}
