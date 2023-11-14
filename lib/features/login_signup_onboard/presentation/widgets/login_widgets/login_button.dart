import 'package:flutter/material.dart';
import 'package:infi_wheel/core/utils/colors.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: size.height*0.08,
        width: size.width*0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.kOrangeWeb,
        ),
        child: TextButton(
          onPressed: () {},
          child: Text(
            "Login",
            style: TextStyle(color: AppColors.kOxfordBlue, fontSize: 16),
          ),
        ),
      ),
    );
  }
}