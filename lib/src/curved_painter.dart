import 'package:flutter/material.dart';

class CurvedPainter extends CustomPainter {
  final Color fillColor;
  final Color strokeColor;
  final Color shadowColor;
  CurvedPainter(
      {this.fillColor = Colors.white,
      this.strokeColor = Colors.white,
      this.shadowColor = Colors.black});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 0); // Start
    path.lineTo(size.width * 0.2, 0);
    path.quadraticBezierTo(size.width * 0.25, 0, size.width * 0.25, 20);
    path.quadraticBezierTo(size.width * 0.25, 45, size.width * 0.30, 45);
    path.quadraticBezierTo(size.width * 0.25, 45, size.width * 0.70, 45);
    path.quadraticBezierTo(size.width * 0.75, 45, size.width * 0.75, 20);
    path.quadraticBezierTo(size.width * 0.75, 0, size.width * 0.80, 0);
    path.lineTo(size.width * 1, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    path.close();
    canvas.drawShadow(path, shadowColor, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
