import 'package:flutter/material.dart';
import 'package:machinetask/core/constants.dart';

class GradientBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const double strokeWidth = 4;
    const double radius = 50;

    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [
          ColorConstants.topside, // top
          ColorConstants.leftside, //left
          ColorConstants.bottomside, // bottom
          ColorConstants.rightside, // left
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final rect = Rect.fromLTWH(
      strokeWidth / 2,
      strokeWidth / 2,
      size.width - strokeWidth,
      size.height - strokeWidth,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, const Radius.circular(radius)),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
