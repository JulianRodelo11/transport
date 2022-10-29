import 'dart:async';
import 'package:permission_handler/permission_handler.dart';

class RequestPermisionController {
  final Permission _locationPermission;
  RequestPermisionController(this._locationPermission);

  final _streamController = StreamController<PermissionStatus>.broadcast();

  Stream<PermissionStatus> get onStatusChanged => _streamController.stream;

  Future<PermissionStatus> check() async {
    final status = await _locationPermission.status;
    return status;
  }

  Future<void> request() async {
    final status = await _locationPermission.request();
    // ignore: avoid_print
    print("status $status");
    _notify(status);
  }

  void _notify(PermissionStatus status) {
    if (!_streamController.isClosed && _streamController.hasListener) {
      _streamController.sink.add(status);
    }
  }

  dispose() {
    _streamController.close();
  }
}
