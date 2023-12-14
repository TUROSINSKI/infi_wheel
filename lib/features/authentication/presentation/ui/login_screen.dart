import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:infi_wheel/core/utils/colors.dart';
import 'package:infi_wheel/features/authentication/data/services/auth_controller.dart';
import 'package:infi_wheel/features/authentication/presentation/providers/auth/auth_blocs.dart';
import 'package:infi_wheel/features/authentication/presentation/providers/auth/auth_events.dart';
import 'package:infi_wheel/features/authentication/presentation/providers/auth/auth_states.dart';
import 'package:infi_wheel/features/authentication/presentation/widgets/login_widgets/login_button.dart';
import 'package:infi_wheel/features/authentication/presentation/widgets/login_widgets/login_input_field.dart';
import 'package:infi_wheel/features/authentication/presentation/widgets/login_widgets/login_large_text.dart';
import 'package:infi_wheel/features/authentication/presentation/widgets/login_widgets/social_bar.dart';

import '../../../../shared/widgets/background_custom_painter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            // Upper Section (Image and Texts)
            Expanded(
              child: Center(
                child: Hero(
                  tag: 'signuplogo-tag',
                  child: Image.asset(
                    "assets/images/logo_przezroczyste_granat.png",
                    height: 84.h,
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
                  height: MediaQuery.of(context).size.height * 0.75,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.kWhite,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Sign In using socials", style: TextStyle(color: AppColors.kOxfordBlue, fontSize: 16.h),),
                      SizedBox(height: 16.h),
                      socialBar(),
                      SizedBox(height: 32.h),
                      Text("Or use your existing account", style: TextStyle(color: AppColors.kOxfordBlue, fontSize: 16.h),),
                      SizedBox(height: 16.h),
                      loginInputField(Icons.mail, TextInputType.emailAddress, TextInputAction.next, 'Email', false, (value) { }),
                      loginInputField(Icons.lock, TextInputType.visiblePassword, TextInputAction.done, 'Password', true, (value) { }),
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
