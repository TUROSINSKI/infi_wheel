import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:infi_wheel/core/utils/colors.dart';
import 'package:infi_wheel/features/authentication/presentation/widgets/login_widgets/login_button.dart';
import 'package:infi_wheel/features/authentication/presentation/widgets/login_widgets/login_input_field.dart';
import 'package:infi_wheel/features/authentication/presentation/widgets/login_widgets/social_bar.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
                child: SingleChildScrollView(
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
                        loginInputField(Icons.mail, TextInputType.emailAddress, TextInputAction.next, 'Email', false, _usernameController),
                        loginInputField(Icons.lock, TextInputType.visiblePassword, TextInputAction.done, 'Password', true, _passwordController ),
                        SizedBox(height: 28.h),
                        AuthButton(
                          text: "Sign In",
                          color: AppColors.kOrangeWeb,
                          fun: () {
                            GoRouter.of(context).go('/home');
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
            ),
          ],
        ),
      ]),
    );
  }
}
