import 'dart:ui' as ui;
import 'package:app_transport/app/domain/models/place.dart';
import 'package:app_transport/app/ui/pages/home/widgets/custom_marker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<BitmapDescriptor> placeToMarker(
    Place place, int? duration, int? length) async {
  final recoder = ui.PictureRecorder();
  final canvas = ui.Canvas(recoder);
  const size = ui.Size(340, 100);

  final customMarker = MyCustomMarker(
    label: place.title,
    duration: duration,
    length: length,
  );
  customMarker.paint(canvas, size);
  final picture = recoder.endRecording();
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
