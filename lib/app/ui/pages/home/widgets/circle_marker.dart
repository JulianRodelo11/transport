import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<BitmapDescriptor> getDotMarker() async {
  final recorder = ui.PictureRecorder();
  final canvas = ui.Canvas(recorder);
  const size = ui.Size(40, 40);
  final custonMarker = CircleMarker();
  custonMarker.paint(canvas, size);
  final picture = recorder.endRecording();
  final image = await picture.toImage(
    size.width.toInt(),
    size.height.toInt(),
  );
  final byteData = await image.toByteData(
    format: ui.ImageByteFormat.png,
  );
  final bytes = byteData!.buffer.asUint8List();
  return BitmapDescriptor.fromBytes(bytes);
}

class CircleMarker extends CustomPainter {
  CircleMarker();
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = const Color(0xFF242527);
    final center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(
      center,
      size.width * 0.5,
      paint,
    );
    paint.color = Colors.white;
    canvas.drawCircle(
      center,
      size.width * 0.15,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
