import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infi_wheel/core/utils/colors.dart';
import 'package:infi_wheel/features/login_signup_onboard/presentation/widgets/login_widgets/login_button.dart';
import 'package:infi_wheel/features/login_signup_onboard/presentation/widgets/login_widgets/login_input_field.dart';
import 'package:infi_wheel/features/login_signup_onboard/presentation/widgets/login_widgets/login_large_text.dart';
import 'package:infi_wheel/features/login_signup_onboard/presentation/widgets/login_widgets/social_button.dart';

import '../widgets/onboarding_widgets/background_custom_painter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      CustomPaint(
        size:
            Size(double.infinity, double.infinity), 
        painter: BackgroundPainter(),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(child: LoginlargeText(text: "InfiWheel")),
          Align(
            alignment: Alignment
                .topCenter, 
            child: Container(
              width: 200, 
              child: Image.asset("assets/icons/applogo.png"),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              LoginInputField(
                hint: "Email",
                inputAction: TextInputAction.next,
                inputType: TextInputType.emailAddress,
                icon: Icons.email,
                obscure: false,
              ),
              LoginInputField(
                hint: "Password",
                inputAction: TextInputAction.done,
                inputType: TextInputType.visiblePassword,
                icon: Icons.lock,
                obscure: true,
              ),
              Text(
                "Forgot password?",
                style: TextStyle(color: AppColors.kPlatinum),
              ),
              SizedBox(height: 20),
              LoginButton(),
              SizedBox(height: 40),
              
            ],
          ),
          Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // TODO: change icons and add press functionality
                  SocialButton(icon: "assets/icons/applogo.png", press: (){}),
                  SocialButton(icon: "assets/icons/applogo.png", press: (){}),
                  SocialButton(icon: "assets/icons/applogo.png", press: (){}),
                ],
              )
        ],
      ),
    ]));
  }
}
