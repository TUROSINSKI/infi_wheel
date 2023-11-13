import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infi_wheel/core/theme/theme_data.dart';
import 'package:infi_wheel/features/login_signup_onboard/presentation/providers/onboarding_providers/onboarding_blocs.dart';
import 'package:infi_wheel/features/login_signup_onboard/presentation/ui/onboarding_screen.dart';
import 'package:infi_wheel/features/login_signup_onboard/presentation/ui/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>OnboardingBloc(),
      child: MaterialApp(
        title: 'InfiWheel',
        debugShowCheckedModeBanner: false,
        theme: lightThemeData,
        darkTheme: darkThemeData,
        home: OnboardingScreen(),
      ),
    );
  }
}
