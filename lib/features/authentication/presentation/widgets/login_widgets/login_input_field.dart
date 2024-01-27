import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infi_wheel/core/utils/colors.dart';

Widget loginInputField(IconData icon, TextInputType inputType,
    TextInputAction inputAction, String hint, bool obscure, TextEditingController controller)
     {
      return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 0.5,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: 56.h,
          width: 300.w,
          decoration: BoxDecoration(
            color: AppColors.kPlatinum,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: TextField(
              controller: controller,
              style: const TextStyle(color: AppColors.kBlack),
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(icon, size: 30, color: AppColors.kOxfordBlue,)),
                hintText: hint,
                hintStyle: const TextStyle(
                  color: TextColors.kOnBoardText
                )
              ),
              obscureText: obscure,
              keyboardType: inputType,
              textInputAction: inputAction,
            ),
          ),
        ),
      ),
    );
    }
