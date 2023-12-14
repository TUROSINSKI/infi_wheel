import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infi_wheel/core/utils/colors.dart';

Widget loginAndRegButton(String buttonText, Color backgroundColor, Color textColor, void Function()? function){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(16),
        child: GestureDetector(
          onTap: function,
          child: Container(
            height: 48.h,
            width: 300.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              // border: Border.all(color: AppColors.kOrangeWeb),
              color: backgroundColor,
            ),
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(color: textColor, fontSize: 16),
              ),
            ),
          ),
        ),
      ),
  );
}