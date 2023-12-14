import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:infi_wheel/core/utils/colors.dart';
import 'package:infi_wheel/core/utils/strings.dart';
import 'package:infi_wheel/features/authentication/presentation/widgets/login_widgets/login_button.dart';
import 'package:infi_wheel/features/authentication/presentation/widgets/login_widgets/login_input_field.dart';
import 'package:infi_wheel/shared/widgets/agreement_text.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            Expanded(
              child: Center(
                child: Hero(
                  tag: 'signuplogo-tag',
                  child: Image.asset(
                    "assets/images/logo_przezroczyste_granat.png",
                    height: 80.h,
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
                      Text("Sign up using your email", style: TextStyle(color: AppColors.kOxfordBlue, fontSize: 16.h),),
                      SizedBox(height: 16.h),
                      loginInputField(Icons.person, TextInputType.text, TextInputAction.next, 'Username', false, (value) { }),
                      loginInputField(Icons.mail, TextInputType.emailAddress, TextInputAction.next, 'Email', false, (value) { }),
                      loginInputField(Icons.lock, TextInputType.visiblePassword, TextInputAction.next, 'Password', true, (value) { }),
                      loginInputField(Icons.repeat, TextInputType.visiblePassword, TextInputAction.done, 'Confirm password', true, (value) { }),
                      SizedBox(height: 28.h),
                      AuthButton(
                        text: "Sign Up",
                        color: AppColors.kOrangeWeb,
                        fun: () {
                          GoRouter.of(context).go('/signup');
                        },
                      ),
                      AuthButton(
                        text: "Go back",
                        color: AppColors.kPlatinum, fun: () {GoRouter.of(context).go('/');},
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
