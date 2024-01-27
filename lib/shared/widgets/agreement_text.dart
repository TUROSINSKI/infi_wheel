import 'package:flutter/material.dart';
import 'package:infi_wheel/core/utils/colors.dart';

class AgreementText extends StatelessWidget {
  const AgreementText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(text: const TextSpan(
      style: TextStyle(color: AppColors.kBlack),
      children: <TextSpan>[
        TextSpan(text: 'By '),
        TextSpan(text: 'Signing Up ', style: TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(text: 'or '),
        TextSpan(text: 'Signing In ', style: TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(text: 'you have\n agreed to our '),
        TextSpan(text: 'Terms and Conditions', style: TextStyle(fontWeight: FontWeight.bold)),
      ]
    ));
  }
}