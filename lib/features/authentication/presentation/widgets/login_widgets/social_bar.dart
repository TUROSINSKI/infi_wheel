import 'package:flutter/material.dart';
import 'package:infi_wheel/features/authentication/presentation/widgets/login_widgets/social_button.dart';

Widget socialBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      // TODO: change icons and add press functionality
      SocialButton(
          icon: "assets/icons/socials/facebook_icon.svg", press: () {}),
      SocialButton(icon: "assets/icons/socials/google_icon.svg", press: () {}),
      SocialButton(icon: "assets/icons/socials/twitter_icon.svg", press: () {}),
    ],
  );
}
