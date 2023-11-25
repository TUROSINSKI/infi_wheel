import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infi_wheel/core/utils/colors.dart';

Widget loginAndRegButton(String buttonText, void Function()? function){
  return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(16),
      child: GestureDetector(
        onTap: function,
        child: Container(
          height: 56.h,
          width: 300.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.kOrangeWeb,
          ),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(color: AppColors.kOxfordBlue, fontSize: 16),
            ),
          ),
        ),
      ),
    );
}