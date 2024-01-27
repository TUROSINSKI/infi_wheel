import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infi_wheel/core/utils/colors.dart';

Widget goBackButton(void Function()? function){
  return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(16),
      child: GestureDetector(
        onTap: function,
        child: Container(
          height: 40.h,
          width: 200.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.kOrangeWeb),
            color: AppColors.kOxfordBlue,
          ),
          child: const Center(
            child: Text(
              "I already have an account",
              style: TextStyle(color: AppColors.kWhite, fontSize: 16),
            ),
          ),
        ),
      ),
    );
}