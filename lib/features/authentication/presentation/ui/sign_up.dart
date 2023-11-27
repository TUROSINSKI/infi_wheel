import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:infi_wheel/core/utils/colors.dart';
import 'package:infi_wheel/features/authentication/presentation/widgets/login_widgets/login_button.dart';
import 'package:infi_wheel/features/authentication/presentation/widgets/login_widgets/login_input_field.dart';
import 'package:infi_wheel/features/authentication/presentation/widgets/onboarding_widgets/background_custom_painter.dart';
import 'package:infi_wheel/features/authentication/presentation/widgets/sign_up_widgets/go_back_button.dart';

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
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 200,
                  child: Image.asset("assets/icons/applogo.png"),
                ),
              ),
              Column(
                children: [
                  loginInputField(Icons.person, TextInputType.name,
                      TextInputAction.next, "Username", false, (value) {}),
                  loginInputField(Icons.email, TextInputType.emailAddress,
                      TextInputAction.next, "Email", false, (value) {}),
                  loginInputField(Icons.lock, TextInputType.visiblePassword,
                      TextInputAction.next, "Password", true, (value) {}),
                  loginInputField(Icons.key, TextInputType.visiblePassword,
                      TextInputAction.done, "Confirm password", true, (value) {}),
                  SizedBox(height: 20.h,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Checkbox(value: false, onChanged: (bool? newValue){}),
                        Flexible(child: Text("By clicking here, I state that I am 18 years of age or older and I have read and understood the terms and conditions.")),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  loginAndRegButton("Create Account", AppColors.kOrangeWeb, AppColors.kOxfordBlue, () {}),
                  SizedBox(height: 20.h),
                  goBackButton(() {GoRouter.of(context).go('/login');}),
                ],
              ),
            ],
          ),
        )
      ],
    ));
  }
}
