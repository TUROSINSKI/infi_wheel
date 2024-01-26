import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:infi_wheel/core/utils/colors.dart';
import 'package:infi_wheel/core/utils/strings.dart';
import 'package:infi_wheel/features/authentication/domain/entities/user.dart';
import 'package:infi_wheel/features/authentication/presentation/blocs/signup/signup_bloc.dart';
import 'package:infi_wheel/features/authentication/presentation/widgets/login_widgets/login_button.dart';
import 'package:infi_wheel/features/authentication/presentation/widgets/login_widgets/login_input_field.dart';
import 'package:infi_wheel/shared/widgets/agreement_text.dart';
import 'package:infi_wheel/shared/widgets/loading_screen.dart';
import 'package:infi_wheel/shared/widgets/toast.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  bool _isFormValid() {
    // Implement form validation logic
    return _passwordController.text == _confirmPasswordController.text &&
        _emailController.text.isNotEmpty &&
        _usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty;
    // Add more validation rules as needed
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
                  toastInfo(message: "Now you can Sign In!");
                  GoRouter.of(context).go('/');
                } else if (state is SignupFailure) {
                  toastInfo(message: state.error);
                }
      },
      builder: (context, state) {
        if (state is SignupLoading) {
          return LoadingScreen();
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
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [AppColors.kPlatinum, AppColors.kOrangeWeb],
                            begin: Alignment.centerLeft,
                            end: Alignment.topRight)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
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
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32)),
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
                                Text(
                                  "Sign up using your email",
                                  style: TextStyle(
                                      color: AppColors.kOxfordBlue, fontSize: 16.h),
                                ),
                                SizedBox(height: 16.h),
                                loginInputField(
                                    Icons.person,
                                    TextInputType.text,
                                    TextInputAction.next,
                                    'Username',
                                    false,
                                    _usernameController),
                                loginInputField(
                                    Icons.mail,
                                    TextInputType.emailAddress,
                                    TextInputAction.next,
                                    'Email',
                                    false,
                                    _emailController),
                                loginInputField(
                                    Icons.lock,
                                    TextInputType.visiblePassword,
                                    TextInputAction.next,
                                    'Password',
                                    true,
                                    _passwordController),
                                loginInputField(
                                    Icons.repeat,
                                    TextInputType.visiblePassword,
                                    TextInputAction.done,
                                    'Confirm password',
                                    true,
                                    _confirmPasswordController),
                                SizedBox(height: 28.h),
                                AuthButton(
                                  text: "Sign Up",
                                  color: AppColors.kOrangeWeb,
                                  fun: () {
                                    if (_isFormValid()) {
                                      BlocProvider.of<SignupBloc>(context)
                                          .add(SignupSubmitted(
                                        User(
                                          email: _emailController.text,
                                          username: _usernameController.text,
                                          password: _passwordController.text,
                                        ),
                                      ));
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
