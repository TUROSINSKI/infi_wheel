import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infi_wheel/core/utils/colors.dart';


class SocialButton extends StatelessWidget {
  const SocialButton({
    required this.icon,
    required this.press,
    super.key,
  });

  final String icon;
  final void Function() press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        height: 50,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.all(2),
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16),
          ),
          child: SvgPicture.asset(icon,),
        ),
      ),
    );
  }
}