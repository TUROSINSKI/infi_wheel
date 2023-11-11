import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infi_wheel/core/utils/colors.dart';
import 'package:infi_wheel/features/login_signup/presentation/ui/widget/login_widgets/login_input_field.dart';
import 'package:infi_wheel/features/login_signup/presentation/ui/widget/login_widgets/login_large_text.dart';

import 'widget/onboarding_widgets/background_custom_painter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            child: Center(child: LoginlargeText(text: "InfiWheel"))
          ),
            LoginInputField(hint: "Email", inputAction: TextInputAction.next, inputType: TextInputType.emailAddress, icon: Icons.email, obscure: false,),
            LoginInputField(hint: "Password", inputAction: TextInputAction.done, inputType: TextInputType.visiblePassword, icon: Icons.lock, obscure: true,)
        ],
      )
    );
  }
}

