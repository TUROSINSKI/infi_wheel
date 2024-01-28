import 'package:flutter/material.dart';
import 'package:infi_wheel/core/theme/color_schemes.dart';
import 'package:infi_wheel/core/utils/colors.dart';

final ThemeData lightThemeData = ThemeData(
  colorScheme: lightColorScheme,
  fontFamily: "Lato",
  textTheme: TextTheme(
    bodySmall: TextStyle(color: AppColors.kOxfordBlue),
    bodyMedium: TextStyle(color: AppColors.kOxfordBlue),
    bodyLarge: TextStyle(color: AppColors.kOxfordBlue),
  )
);

// Dark Theme
final ThemeData darkThemeData = ThemeData(
  colorScheme: darkColorScheme,
  fontFamily: "Lato",
);