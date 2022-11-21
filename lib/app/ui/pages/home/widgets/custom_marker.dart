import 'package:flutter/material.dart';

class MyCustomMarker extends CustomPainter {
  final String label;
  final int? duration;
  final int? length;

  MyCustomMarker({
    required this.label,
    required this.duration,
    required this.length,
  });

  // void _drawText({
  //   required Canvas canvas,
  //   required Size size,
  //   required String text,
  //   required double width,
  //   double? dx,
  //   double? dy,
  //   String? fontFamily,
  //   double fontSize = 30,
  //   Color color = Colors.black,
  //   FontWeight? fontWeight,
  // }) {
  //   final textPainter = TextPainter(
  //     text: TextSpan(
  //       text: text,
  //       style: TextStyle(
  //         color: color,
  //         fontFamily: fontFamily,
  //         fontSize: fontSize,
  //         fontWeight: fontWeight,
  //         overflow: TextOverflow.ellipsis,
  //       ),
  //     ),
  //     textDirection: TextDirection.ltr,
  //     maxLines: 1,
  //   );

  //   textPainter.layout(
  //     maxWidth: width,
  //   );

  //   textPainter.paint(
  //     canvas,
  //     Offset(
  //       dx ?? size.height * 0.5 - textPainter.width * 0.5,
  //       size.height * 0.5 - textPainter.size.height * 0.5 + (dy ?? 0),
  //     ),
  //   );
  // }

  @override
  void paint(Canvas canvas, Size size) {
    /*final paint = Paint();
    paint.color = Colors.white;

    final rRect = RRect.fromLTRBR(
      0,
      0,
      size.width,
      size.height,
      const Radius.circular(10),
    );

    canvas.drawRRect(rRect, paint);*/

    /*paint.color = Colors.black;

    final miniRect = RRect.fromLTRBAndCorners(
      0,
      0,
      size.height,
      size.height,
      topLeft: const Radius.circular(5),
      bottomLeft: const Radius.circular(5),
    );

    canvas.drawRRect(miniRect, paint);*/

    // _drawText(
    //   canvas: canvas,
    //   size: size,
    //   text: label,
    //   dx: size.height,
    //   width: size.width,
    // );

    /*_drawText(
      canvas: canvas,
      size: size,
      text: String.fromCharCode(
        Icons.expand_more.codePoint,
      ),
      fontFamily: Icons.expand_more.fontFamily,
      fontSize: 40,
      color: Colors.black,
      width: size.height,
    );*/
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
