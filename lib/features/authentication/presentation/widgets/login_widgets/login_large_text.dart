import 'package:flutter/material.dart';
import 'package:infi_wheel/core/utils/colors.dart';

class LoginlargeText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  LoginlargeText({
    super.key,
    this.size = 40,
    required this.text,
    this.color = AppColors.kOxfordBlue,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
    );
  }
}
