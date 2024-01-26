import 'package:flutter/material.dart';
import 'package:infi_wheel/core/utils/colors.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [AppColors.kPlatinum, AppColors.kOrangeWeb],
                begin: Alignment.centerLeft,
                end: Alignment.topRight)),
        child: Center(
          child: Lottie.asset('assets/animations/CarAnimation.json'),
        ),
      ),
    );
  }
}
