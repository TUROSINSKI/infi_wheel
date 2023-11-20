import 'dart:js';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infi_wheel/features/authentication/presentation/ui/onboarding_screen.dart';

class InfiWheelRouter {

  GoRouter router = GoRouter(

    routes: [
      GoRoute(
        name: 'home',
        path: '/',
        pageBuilder: (context, state){
          return MaterialPage(child: OnboardingScreen());
        },
      )
    ]
  );
}