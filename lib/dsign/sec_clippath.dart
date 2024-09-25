import 'package:flutter/material.dart'; //Sec

class SecRPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paintFill0 = Paint()
      ..color = const Color.fromARGB(255, 81, 189, 195)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * -0.0007444, size.height * 0.2445400);
    path_0.lineTo(size.width * 0.0007368, size.height * 1.0164400);
    path_0.lineTo(size.width * 1.0376334, size.height * 1.0164400);
    path_0.quadraticBezierTo(size.width * 1.0365111, size.height * 0.7011200,
        size.width * 1.0376111, size.height * 0.5960000);
    path_0.cubicTo(
        size.width * 0.5689556,
        size.height * 0.8888600,
        size.width * 0.3116444,
        size.height * 0.5191400,
        size.width * 0.1306778,
        size.height * 0.3262600);
    path_0.quadraticBezierTo(size.width * 0.0696444, size.height * 0.2658600,
        size.width * -0.0007444, size.height * 0.2445400);
    path_0.close();

    canvas.drawPath(path_0, paintFill0);

    // Layer 1

    Paint paintStroke0 = Paint()
      ..color = const Color.fromARGB(255, 81, 189, 195)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paintStroke0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
