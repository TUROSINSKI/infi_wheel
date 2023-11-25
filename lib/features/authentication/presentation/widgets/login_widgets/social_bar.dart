import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infi_wheel/core/utils/colors.dart';
import 'package:infi_wheel/features/authentication/presentation/widgets/login_widgets/social_button.dart';

Widget socialBar() {
  return Container(
    height: 56.h,
    width: 240.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: AppColors.kPlatinum,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // TODO: change icons and add press functionality
        SocialButton(
            icon: "assets/icons/socials/facebook_icon.svg", press: () {}),
        SocialButton(icon: "assets/icons/socials/google_icon.svg", press: () {}),
        SocialButton(icon: "assets/icons/socials/twitter_icon.svg", press: () {}),
      ],
    ),
  );
}
