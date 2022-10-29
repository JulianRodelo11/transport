import 'dart:ui' as ui;
import 'package:app_transport/app/domain/models/place.dart';
import 'package:app_transport/app/ui/pages/home/widgets/custom_marker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<BitmapDescriptor> placeToMarker(Place place, int? duration) async {
  final recorder = ui.PictureRecorder();
  final canvas = ui.Canvas(recorder);
  const size = ui.Size(80, 80);
  final custonMarker = MyCustonMarker(
    label: place.title,
    duration: duration,
  );
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
