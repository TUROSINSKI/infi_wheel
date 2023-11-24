import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infi_wheel/core/utils/colors.dart';
import 'package:infi_wheel/features/authentication/presentation/providers/auth/auth_blocs.dart';
import 'package:infi_wheel/features/authentication/presentation/providers/auth/auth_events.dart';
import 'package:infi_wheel/features/authentication/presentation/providers/auth/auth_states.dart';
import 'package:infi_wheel/features/authentication/presentation/widgets/login_widgets/login_button.dart';
import 'package:infi_wheel/features/authentication/presentation/widgets/login_widgets/login_input_field.dart';
import 'package:infi_wheel/features/authentication/presentation/widgets/login_widgets/login_large_text.dart';
import 'package:infi_wheel/features/authentication/presentation/widgets/login_widgets/social_bar.dart';

import '../widgets/onboarding_widgets/background_custom_painter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      CustomPaint(
        size: Size(double.infinity, double.infinity),
        painter: BackgroundPainter(),
      ),
      BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(child: LoginlargeText(text: "InfiWheel")),
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
                loginInputField(
                  context,
                  Icons.email,
                  TextInputType.emailAddress,
                  TextInputAction.next,
                  "Email",
                  false,
                  (value){context.read<AuthBloc>().add(EmailEvent(value));}
                ),
                loginInputField(
                  context,
                  Icons.lock,
                  TextInputType.visiblePassword,
                  TextInputAction.done,
                  "Password",
                  true,
                  (value){context.read<AuthBloc>().add(PasswordEvent(value));}
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
            socialBar(),
          ],
        );
      })
    ]));
  }
}
