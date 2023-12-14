import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:infi_wheel/core/utils/colors.dart';
import 'package:infi_wheel/core/utils/strings.dart';
import 'package:infi_wheel/shared/widgets/agreement_text.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [AppColors.kPlatinum, AppColors.kOrangeWeb],
                  begin: Alignment.centerLeft,
                  end: Alignment.topRight)),
        ),
        Column(
          children: <Widget>[
            // Upper Section (Image and Texts)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Hero(
                    tag: 'signuplogo-tag',
                    child: Image.asset(
                      "assets/images/logo_przezroczyste_granat.png",
                      height: 80.h,
                    ),
                  ),
                ),
              ),
            ),
            Material(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32), topRight: Radius.circular(32)),
              elevation: 8,
              child: Hero(
                tag: 'signup-tag',
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.kWhite,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Welcome to InfiWheel',
                          style: TextStyle(
                              color: AppColors.kOxfordBlue,
                              fontSize: 24.h,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          onboardingText,
                          style: TextStyle(
                            color: AppColors.kOxfordBlue,
                            fontSize: 16.h,
                          ),
                        ),
                      ),
                      SizedBox(height: 28.h),
                      OnboardButton(
                        text: "Sign Up",
                        color: AppColors.kOrangeWeb,
                        fun: () {
                          GoRouter.of(context).go('/signup');
                        },
                      ),
                      OnboardButton(
                        text: "Go back",
                        color: AppColors.kPlatinum, fun: () {GoRouter.of(context).go('/');},
                      ),
                      SizedBox(height: 28.h),
                      AgreementText(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

class OnboardButton extends StatelessWidget {
  const OnboardButton(
      {super.key, required this.text, required this.color, required this.fun});

  final String text;
  final Color color;
  final void Function() fun;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: fun,
        child: Text(
          text,
          style: TextStyle(fontSize: 16.h),
        ),
        style: ElevatedButton.styleFrom(
            fixedSize: Size(300, 48),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            backgroundColor: color,
            foregroundColor: AppColors.kBlack),
      ),
    );
  }
}
