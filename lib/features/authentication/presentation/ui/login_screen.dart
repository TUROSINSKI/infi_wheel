import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:infi_wheel/core/utils/colors.dart';
import 'package:infi_wheel/features/authentication/presentation/blocs/signin/signin_bloc.dart';
import 'package:infi_wheel/features/authentication/presentation/widgets/login_widgets/login_button.dart';
import 'package:infi_wheel/features/authentication/presentation/widgets/login_widgets/login_input_field.dart';
import 'package:infi_wheel/features/authentication/presentation/widgets/login_widgets/social_bar.dart';
import 'package:infi_wheel/shared/widgets/loading_screen.dart';
import 'package:infi_wheel/shared/widgets/toast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _isFormValid() {
    return _usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninBloc, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          GoRouter.of(context).go('/home');
        } else if (state is SigninFailure) {
          toastInfo(message: state.error);
        }
      },
      builder: (context, state) {
        if (state is SigninLoading) {
          return const LoadingScreen();
        } else {
          return Scaffold(
            // resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: IntrinsicHeight(
                  child: Stack(children: <Widget>[
                    Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [AppColors.kPlatinum, AppColors.kOrangeWeb],
                              begin: Alignment.centerLeft,
                              end: Alignment.topRight)),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        // Upper Section (Image and Texts)
                        Expanded(
                          child: Center(
                            child: Image.asset(
                              "assets/images/logo_przezroczyste_granat.png",
                              height: 84.h,
                            ),
                          ),
                        ),
                        Material(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32)),
                          elevation: 8,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  color: AppColors.kWhite,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(32),
                                      topRight: Radius.circular(32))),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Sign In using socials",
                                      style: TextStyle(
                                          color: AppColors.kOxfordBlue,
                                          fontSize: 16.h),
                                    ),
                                    SizedBox(height: 16.h),
                                    socialBar(),
                                    SizedBox(height: 32.h),
                                    Text(
                                      "Or use your existing account",
                                      style: TextStyle(
                                          color: AppColors.kOxfordBlue,
                                          fontSize: 16.h),
                                    ),
                                    SizedBox(height: 16.h),
                                    loginInputField(
                                        Icons.mail,
                                        TextInputType.text,
                                        TextInputAction.next,
                                        'Email',
                                        false,
                                        _usernameController),
                                    loginInputField(
                                        Icons.lock,
                                        TextInputType.visiblePassword,
                                        TextInputAction.done,
                                        'Password',
                                        true,
                                        _passwordController),
                                    SizedBox(height: 28.h),
                                    AuthButton(
                                      text: "Sign In",
                                      color: AppColors.kOrangeWeb,
                                      fun: () {
                                        if (_isFormValid()) {
                                          BlocProvider.of<SigninBloc>(context).add(
                                            SigninSubmitted(
                                              _usernameController.text,
                                              _passwordController.text,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    AuthButton(
                                      text: "Go back",
                                      color: AppColors.kPlatinum,
                                      fun: () {
                                        GoRouter.of(context).go('/');
                                      },
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
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
