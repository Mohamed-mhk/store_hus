import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paintFill0 = Paint()
      ..color = const Color.fromARGB(255, 81, 189, 195)
      ..style = PaintingStyle.fill;

    Path path_0 = Path();
    path_0.moveTo(size.width, 0);
    path_0.lineTo(size.width, size.height * 0.4);
    path_0.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.6,
      size.width * 0.5,
      size.height * 0.5,
    );
    path_0.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.4,
      0,
      size.height * 0.8,
    );
    path_0.lineTo(0, 0);
    path_0.close();

    canvas.drawPath(path_0, paintFill0);

    Paint paintStroke0 = Paint()
      ..color = const Color.fromARGB(255, 81, 189, 195)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawPath(path_0, paintStroke0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
