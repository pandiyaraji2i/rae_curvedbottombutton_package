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
    double pathStartPoint = 0.20;
    double leftArcControlPoint = 0.24;
    double rightArcControlPoint = 0.76;
    double firstBezierHeight = 15.0;
    double secondBezierHeight = 47.0;
    double straightLineStartPoint = 0.30;
    double firstBezierCurvePoint = 0.35;
    double straightLineEndPath = 0.65;
    double pathEndPoint = 0.80;
    
    Path path = Path();
    path.moveTo(0, 0); // Start
    path.lineTo(width * pathStartPoint ,0);
    path.quadraticBezierTo(width * leftArcControlPoint, 0, width * leftArcControlPoint, firstBezierHeight);
    path.quadraticBezierTo(width * leftArcControlPoint, secondBezierHeight, width * firstBezierCurvePoint, secondBezierHeight);
    path.quadraticBezierTo(width * straightLineStartPoint, secondBezierHeight, width * straightLineEndPath, secondBezierHeight);
    path.quadraticBezierTo(width * rightArcControlPoint, secondBezierHeight, width * rightArcControlPoint, firstBezierHeight);
    path.quadraticBezierTo(width * rightArcControlPoint, 0, width * pathEndPoint, 0);
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
