import 'package:app_transport/app/data/navite_code/background_location.dart';
import 'package:app_transport/app/domain/repositories/background_location_repository.dart';

class BackgroundLocationImpl implements BackgroundLocationRepository {
  final BackgroundLocation _backgroundLocation;

  BackgroundLocationImpl(this._backgroundLocation);
  @override
  Future<void> startForegroundService() {
    return _backgroundLocation.startForegroundService();
  }

  @override
  Future<void> stopForegroundService() {
    return _backgroundLocation.stopForegroundService();
  }
}
