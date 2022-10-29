import 'package:app_transport/app/data/providers/remote/routes_api.dart';
import 'package:app_transport/app/domain/models/route.dart';
import 'package:app_transport/app/domain/repositories/routes_repository.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

class RoutesRepositoryImpl implements RouteRepository {
  final RoutesApi _routesApi;

  RoutesRepositoryImpl(this._routesApi);
  @override
  Future<List<Route>?> get({
    required LatLng origin,
    required LatLng destination,
  }) {
    return _routesApi.get(origin: origin, destination: destination);
  }
}
