import 'dart:ui';
import 'package:app_transport/app/domain/models/place.dart';
import 'package:app_transport/app/domain/models/route.dart';
import 'package:app_transport/app/ui/pages/home/controller/home_state.dart';
import 'package:app_transport/app/ui/pages/home/controller/utils/place_to_marker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<HomeState> setRouteAndMarkers({
  required HomeState state,
  required List<Route> routes,
  required Place origin,
  required Place destination,
  required BitmapDescriptor dot,
}) async {
  final markersCopy = {...state.markers};

  const originId = MarkerId('origin');
  const destinationId = MarkerId('destination');
  const originDot = MarkerId('originDot');
  const destinationDot = MarkerId('destinationDot');

  final route = routes.first;

  final originIcon = await placeToMarker(origin, null);
  final destinationIcon = await placeToMarker(
    destination,
    route.duration,
  );

  final originMarker = Marker(
    markerId: originId,
    position: route.points.first,
    icon: originIcon,
    anchor: const Offset(0.5, 1.3),
  );

  final destinationMarker = Marker(
    markerId: destinationId,
    position: destination.position,
    icon: destinationIcon,
    anchor: const Offset(0.5, 1.3),
  );
  markersCopy[originId] = originMarker;
  markersCopy[destinationId] = destinationMarker;

  markersCopy[originDot] = Marker(
    markerId: originDot,
    position: route.points.first,
    icon: dot,
    anchor: const Offset(0.5, 0.5),
  );

  markersCopy[destinationDot] = Marker(
    markerId: destinationDot,
    position: route.points.last,
    icon: dot,
    anchor: const Offset(0.5, 0.5),
  );

  final polylinesCopy = {...state.polylines};
  const polylineId = PolylineId('route');
  final polyline = Polyline(
    polylineId: polylineId,
    points: route.points,
    width: 3,
    color: const Color(0xFF242527),
  );

  polylinesCopy[polylineId] = polyline;

  return state.copyWhith(
    origin: origin,
    destination: destination,
    markers: markersCopy,
    polylines: polylinesCopy,
    fetching: false,
  );
}
