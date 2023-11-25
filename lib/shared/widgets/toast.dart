import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:infi_wheel/core/utils/colors.dart';

toastInfo(
    {required String message,
    Color backgroundColor = AppColors.kOrangeWeb,
    Color textColor = AppColors.kOxfordBlue}) {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 2,
    backgroundColor: AppColors.kOrangeWeb.withOpacity(0.8),
    textColor: textColor,
    fontSize: 16.sp,
  );
}
