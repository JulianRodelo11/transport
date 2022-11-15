import 'package:app_transport/app/utils/platform.dart';
import 'package:flutter/services.dart';

class BackgroundLocation {
  final _channel = const MethodChannel('app.andokke/background-location');

  Future<void> startForegroundService() async {
    if (isAndorid) {
      await _channel.invokeMethod('start');
    }
  }

  Future<void> stopForegroundService() async {
    if (isAndorid) {
      await _channel.invokeMethod('stop');
    }
  }
}
