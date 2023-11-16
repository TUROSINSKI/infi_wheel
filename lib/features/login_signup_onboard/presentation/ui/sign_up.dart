import 'package:flutter/material.dart';
import 'package:infi_wheel/core/utils/colors.dart';
import 'package:infi_wheel/features/login_signup_onboard/presentation/widgets/login_widgets/login_button.dart';
import 'package:infi_wheel/features/login_signup_onboard/presentation/widgets/login_widgets/login_input_field.dart';
import 'package:infi_wheel/features/login_signup_onboard/presentation/widgets/login_widgets/login_large_text.dart';
import 'package:infi_wheel/features/login_signup_onboard/presentation/widgets/onboarding_widgets/background_custom_painter.dart';
import 'package:infi_wheel/features/login_signup_onboard/presentation/widgets/sign_up_widgets/sign_up_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            size: Size(double.infinity, double.infinity),
            painter: BackgroundPainter(),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Flexible(child: LoginlargeText(text: "InfiWheel")),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 200,
                    child: Image.asset("assets/icons/applogo.png"),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    LoginInputField(
                      hint: "Username",
                      inputAction: TextInputAction.next,
                      inputType: TextInputType.text,
                      icon: Icons.person,
                      obscure: false,
                    ),
                    LoginInputField(
                      hint: "Email",
                      inputAction: TextInputAction.next,
                      inputType: TextInputType.emailAddress,
                      icon: Icons.email,
                      obscure: false,
                    ),
                    LoginInputField(
                      hint: "Password",
                      inputAction: TextInputAction.next,
                      inputType: TextInputType.visiblePassword,
                      icon: Icons.lock,
                      obscure: true,
                    ),
                    LoginInputField(
                      hint: "Confirm password",
                      inputAction: TextInputAction.next,
                      inputType: TextInputType.visiblePassword,
                      icon: Icons.repeat,
                      obscure: true,
                    ),
                    // LoginInputField( TODO: Make it intl date picker
                    //   hint: "Date of birth",
                    //   inputAction: TextInputAction.done,
                    //   inputType: TextInputType.datetime,
                    //   icon: Icons.cake,
                    //   obscure: false,
                    // ),
                    SizedBox(height: 20),
                    SignUpButton(),
                    SizedBox(height: 40),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
