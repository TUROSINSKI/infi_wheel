import 'package:flutter/material.dart';
import 'package:infi_wheel/core/utils/colors.dart';

class OnboardingText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  OnboardingText({
    super.key,
    this.size = 16,
    required this.text,
    this.color = TextColors.kOnBoardText,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }
}
