import 'package:flutter/material.dart';
import 'package:infi_wheel/config/theme/theme_data.dart';
import 'package:infi_wheel/features/login_signup/presentation/ui/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InfiWheel',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData,
      darkTheme: darkThemeData,
      home: OnboardingScreen(),
    );
  }
}
