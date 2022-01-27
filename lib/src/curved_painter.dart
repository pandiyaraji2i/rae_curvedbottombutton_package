import 'dart:math';

import 'package:flutter/material.dart';

class CurvedPainter extends CustomPainter {

  final Color fillColor;
  final Color strokeColor;
  final Color shadowColor;
  CurvedPainter({this.fillColor  = Colors.white, this.strokeColor = Colors.white, this.shadowColor = Colors.black});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;

     Paint paint1 = new Paint()
      ..color = strokeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0;
   
    Path path = Path();
    Path path1 = Path();
    path.moveTo(0, 0); // Start
    path.quadraticBezierTo(size.width * 0.10, 0, size.width * 0.15, 0);
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.20, 20);
    path.arcToPoint(Offset(size.width * 0.80, 20), radius: Radius.circular(1.0), clockwise: false,rotation: -(pi / 2));
    path.quadraticBezierTo(size.width * 0.80, 0, size.width * 0.85, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);

    path.moveTo(20, size.height);
    
    // path1.moveTo(size.width * 0.40, 40);
    // path1.lineTo(size.width * 0.80, 40);

    canvas.drawShadow(path, shadowColor, 5, true);
    canvas.drawPath(path, paint);
    // canvas.drawPath(path1, paint1);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}