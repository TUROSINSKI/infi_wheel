import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infi_wheel/core/routes/route_values.dart';
import 'package:infi_wheel/features/authentication/presentation/ui/login_screen.dart';
import 'package:infi_wheel/features/authentication/presentation/ui/onboarding_screen.dart';
import 'package:infi_wheel/features/authentication/presentation/ui/sign_up.dart';

class InfiWheelRouter {

  static Widget _onboardingPageRouteBuilder(BuildContext context, GoRouterState state) => const OnboardingScreen();
  static Widget _loginPageRouteBuilder(BuildContext context, GoRouterState state) => const LoginScreen();
  static Widget _signupPageRouteBuilder(BuildContext context, GoRouterState state) => const SignUpScreen();
  
  static final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(path: RoutePaths.root, builder: _onboardingPageRouteBuilder),
      GoRoute(path: RoutePaths.login, builder: _loginPageRouteBuilder),
      GoRoute(path: RoutePaths.signup, builder: _signupPageRouteBuilder),
    ]
  );

  static GoRouter get router => _router;
}