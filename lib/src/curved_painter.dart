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

    double width = size.width;
    // double leftArcControlPoint = 0.24;
    // double rightArcControlPoint = 0.76;
    // double firstBezierHeight = 15.0;
    // double secondBezierHeight = 47.0;
    Path path = Path();
    path.moveTo(0, 0); // Start
    path.lineTo(width * 0.2 ,0);
    path.quadraticBezierTo(width * 0.24, 0, width * 0.24, 15);
    path.quadraticBezierTo(width * 0.24, 47, width * 0.35, 47);
    path.quadraticBezierTo(width * 0.30, 47, width * 0.65, 47);
    path.quadraticBezierTo(width * 0.76, 47, width * 0.76, 15);
    path.quadraticBezierTo(width * 0.76, 0, width * 0.80, 0);
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
