import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infi_wheel/core/routes/route_values.dart';
import 'package:infi_wheel/features/authentication/presentation/ui/login_screen.dart';
import 'package:infi_wheel/features/authentication/presentation/ui/onboarding_screen.dart';
import 'package:infi_wheel/features/authentication/presentation/ui/sign_up.dart';
import 'package:infi_wheel/features/map_home/presentation/ui/home_screen.dart';

class InfiWheelRouter {

  static Widget _onboardingPageRouteBuilder(BuildContext context, GoRouterState state) => const OnboardingScreen();
  static Widget _loginPageRouteBuilder(BuildContext context, GoRouterState state) => const LoginScreen();
  static Widget _signupPageRouteBuilder(BuildContext context, GoRouterState state) => const SignUpScreen();
  static Widget _homePageRouteBuilder(BuildContext context, GoRouterState state) => const HomeScreen();

  static final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(path: RoutePaths.root, builder: _onboardingPageRouteBuilder),
      GoRoute(path: RoutePaths.login, builder: _loginPageRouteBuilder),
      GoRoute(path: RoutePaths.signup, builder: _signupPageRouteBuilder),
      GoRoute(path: RoutePaths.home, builder: _homePageRouteBuilder),
    ]
  );

  static GoRouter get router => _router;
}