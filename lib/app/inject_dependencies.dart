import 'package:dio/dio.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'data/navite_code/background_location.dart';
import 'data/providers/local/geolocator_wrapper.dart';
import 'data/providers/remote/reverse_geocode_api.dart';
import 'data/providers/remote/routes_api.dart';
import 'data/providers/remote/search_api.dart';
import 'data/providers/repositories_impl/background_location_repository_imp.dart';
import 'data/providers/repositories_impl/reverse_geocode_repository_imp.dart';
import 'data/providers/repositories_impl/routes_repository_impl.dart';
import 'data/providers/repositories_impl/search_repository_impl.dart';
import 'domain/repositories/background_location_repository.dart';
import 'domain/repositories/reverse_geocode_repository.dart';
import 'domain/repositories/routes_repository.dart';
import 'domain/repositories/search_repository.dart';

void injectDependencies() {
  final dio = Dio();
  Get.i.lazyPut<GeolocatorWrapper>(
    () => GeolocatorWrapper(),
  );

  Get.i.lazyPut<ReverseGeocodeRepository>(
    () => ReverseGeocodeRepositoryImpl(
      ReverseGeocodeAPI(dio),
    ),
  );

  Get.i.lazyPut<RoutesRepository>(
    () => RoutesRepositoryImpl(
      RoutesAPI(dio),
    ),
  );

  Get.i.lazyPut<SearchRepository>(
    () => SearchRepositoryImpl(
      SearchAPI(dio),
    ),
  );

  Get.i.lazyPut<BackgroundLocationRepository>(
    () => BackgroundLocationImpl(
      BackgroundLocation(),
    ),
  );
}
