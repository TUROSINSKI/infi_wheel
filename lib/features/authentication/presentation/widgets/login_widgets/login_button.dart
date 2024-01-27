import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infi_wheel/core/utils/colors.dart';

class AuthButton extends StatelessWidget {
  const AuthButton(
      {super.key, required this.text, required this.color, required this.fun});

  final String text;
  final Color color;
  final void Function() fun;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: fun,
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(300, 60),
            elevation: 0.5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            backgroundColor: color,
            foregroundColor: AppColors.kBlack),
        child: Text(
          text,
          style: TextStyle(fontSize: 16.h),
        ),
      ),
    );
  }
}