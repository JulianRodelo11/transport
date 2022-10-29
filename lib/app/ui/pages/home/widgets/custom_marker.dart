import 'package:flutter/material.dart';

class MyCustonMarker extends CustomPainter {
  final String label;
  final int? duration;

  MyCustonMarker({
    required this.label,
    required this.duration,
  });

  void _drawText({
    required Canvas canvas,
    required Size size,
    required String text,
    required double widht,
    double? dx,
    double? dy,
    String? fontFamily,
    double fontSize = 20,
    Color color = Colors.black,
    FontWeight? fontWeight,
  }) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: color,
          fontFamily: fontFamily,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
      textDirection: TextDirection.ltr,
      maxLines: 2,
    );

    textPainter.layout(
      maxWidth: widht,
    );

    textPainter.paint(
      canvas,
      Offset(
        dx ?? size.height * 0.5 - textPainter.width * 0.5,
        size.height * 0.5 - textPainter.size.height * 0.5 + (dy ?? 0),
      ),
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = const Color(0xFF242527);

    final rRect = RRect.fromLTRBR(
      0,
      0,
      size.width,
      size.height,
      const Radius.circular(5),
    );

    canvas.drawRRect(rRect, paint);

    /*paint.color = const Color(0xFF1ed760);

    final minRect = RRect.fromLTRBAndCorners(
      0,
      0,
      size.height,
      size.height,
      topLeft: const Radius.circular(5),
      bottomLeft: const Radius.circular(5),
    );

    canvas.drawRRect(minRect, paint);*/

    /*_drawText(
      canvas: canvas,
      size: size,
      text: label,
      fontSize: 20,
      fontWeight: FontWeight.w500,
      dx: size.height + 15,
      color: Colors.black,
      widht: size.width - size.height - 15,
    );*/

    if (duration == null) {
      _drawText(
        canvas: canvas,
        size: size,
        text: String.fromCharCode(
          Icons.gps_fixed_rounded.codePoint,
        ),
        fontFamily: Icons.gps_fixed_rounded.fontFamily,
        fontSize: 44,
        color: Colors.white,
        widht: size.height,
      );
    } else {
      final realDuration = Duration(seconds: duration!);
      final minutes = realDuration.inMinutes;
      final String durationAsText =
          "${minutes > 59 ? realDuration.inHours : minutes}";
      _drawText(
        canvas: canvas,
        size: size,
        text: durationAsText,
        fontSize: 33,
        dy: -11,
        color: Colors.white,
        widht: size.height,
        fontWeight: FontWeight.w500,
      );

      _drawText(
        canvas: canvas,
        size: size,
        text: minutes > 59 ? "H" : "MIN",
        fontSize: 27,
        dy: 16,
        color: Colors.white,
        widht: size.height,
        fontWeight: FontWeight.bold,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
