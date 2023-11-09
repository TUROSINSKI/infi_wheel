import 'package:flutter/material.dart';
import 'package:infi_wheel/core/utils/colors.dart';

class BackgroundPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    
    Paint paint = Paint()
      ..color = AppColors.kOxfordBlue
      ..style = PaintingStyle.fill;

    Path path = Path();

    path.moveTo(0, size.height - (size.height * 3 / 8));

    path.quadraticBezierTo(
      size.width * 0.25, size.height - (size.height * 2 / 5 + 30),
      size.width * 0.5, size.height - (size.height * 2 / 5),
    );
    path.quadraticBezierTo(
      size.width * 0.75, size.height - (size.height * 2 / 5 - 30),
      size.width, size.height - (size.height * 6 / 13),
    );

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}