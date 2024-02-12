import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:infi_wheel/core/utils/colors.dart';
import 'package:infi_wheel/core/utils/strings.dart';
import 'package:infi_wheel/features/authentication/presentation/widgets/login_widgets/login_button.dart';
import 'package:infi_wheel/shared/widgets/agreement_text.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [AppColors.kPlatinum, AppColors.kOrangeWeb],
                  begin: Alignment.centerLeft,
                  end: Alignment.topRight)),
        ),
        Column(
          children: <Widget>[
            // Upper Section (Image and Texts)
            Expanded(
              child: Center(
                child: Image.asset(
                  "assets/images/logo_przezroczyste_granat.png",
                  height: 100.h,
                ),
              ),
            ),
            Material(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32), topRight: Radius.circular(32)),
              elevation: 8,
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: double.infinity,
                  decoration: const BoxDecoration(
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
                      AuthButton(
                        text: "Sign Up",
                        color: AppColors.kOrangeWeb,
                        fun: () {
                          GoRouter.of(context).go('/signup');
                        },
                      ),
                      AuthButton(
                        text: "Sign In",
                        color: AppColors.kPlatinum,
                        fun: () {
                          GoRouter.of(context).go('/login');
                        },
                      ),
                      SizedBox(height: 28.h),
                      GestureDetector(
                        onTap: () => GoRouter.of(context).go('/terms'),
                        child: AgreementText(),
                      ),
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
