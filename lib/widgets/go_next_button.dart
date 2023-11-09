import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infi_wheel/core/utils/colors.dart';

class NextButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  NextButton({super.key, this.width, this.isResponsive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.kOrangeWeb
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/icons/arrow_next.png", width: 40, height: 40,)
        ],
      ),
    );
  }
}