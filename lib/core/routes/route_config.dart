import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infi_wheel/core/routes/route_values.dart';
import 'package:infi_wheel/features/authentication/presentation/ui/login_screen.dart';
import 'package:infi_wheel/features/authentication/presentation/ui/onboarding_screen.dart';
import 'package:infi_wheel/features/authentication/presentation/ui/sign_up.dart';
import 'package:infi_wheel/features/booking/presentation/ui/bookings_screen.dart';
import 'package:infi_wheel/features/booking/presentation/ui/rent_screen.dart';
import 'package:infi_wheel/features/cars/domain/entities/car.dart';
import 'package:infi_wheel/features/cars/presentation/ui/add_car_screen.dart';
import 'package:infi_wheel/features/cars/presentation/ui/my_cars_screen.dart';
import 'package:infi_wheel/features/map_home/presentation/ui/admin_cars_dashboard.dart';
import 'package:infi_wheel/features/map_home/presentation/ui/admin_dashboard.dart';
import 'package:infi_wheel/features/map_home/presentation/ui/home_screen.dart';
import 'package:infi_wheel/features/map_home/presentation/ui/update_car_screen.dart';
import 'package:infi_wheel/features/profile/presentation/ui/change_email.dart';
import 'package:infi_wheel/features/profile/presentation/ui/profile_serttings.dart';
import 'package:infi_wheel/shared/screens/terms_and_conditions.dart';

class InfiWheelRouter {

  static Widget _onboardingPageRouteBuilder(BuildContext context, GoRouterState state) => const OnboardingScreen();
  static Widget _loginPageRouteBuilder(BuildContext context, GoRouterState state) => const LoginScreen();
  static Widget _signupPageRouteBuilder(BuildContext context, GoRouterState state) => const SignUpScreen();
  static Widget _homePageRouteBuilder(BuildContext context, GoRouterState state) => const HomeScreen();
  static Widget _termsAndConditionsPageRouteBuilder(BuildContext context, GoRouterState state) => const TermsAndConditions();
  static Widget _profilePageRouteBuilder(BuildContext context, GoRouterState state) => const ProfileSettings();
  static Widget _changeEmailPageRouteBuilder(BuildContext context, GoRouterState state) => const ChangeEmailPage();
  static Widget _myCarsPageRouteBuilder(BuildContext context, GoRouterState state) => const MyCarsScreen();
  static Widget _addCarPageRouteBuilder(BuildContext context, GoRouterState state) => const AddCarScreen();
  static Widget _bookingsPageRouteBuilder(BuildContext context, GoRouterState state) => const BookingsScreen();
  static Widget _adminDashboardRouteBuilder(BuildContext context, GoRouterState state) => const AdminDashboard();
  // static Widget _rentCarRouteBuilder(BuildContext context, GoRouterState state) => const RentScreen();
  static Widget _rentCarRouteBuilder(BuildContext context, GoRouterState state) {
    final car = state.extra as Car?;
    return RentScreen(car: car);
  }
  static Widget _adminCarsRouteBuilder(BuildContext context, GoRouterState state) => const AdminCarListPage();
  static Widget _editCarRouteBuilder(BuildContext context, GoRouterState state) {
    final car = state.extra as Car;
    return UpdateCarScreen(car: car);
  }





  static final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(path: RoutePaths.root, builder: _onboardingPageRouteBuilder),
      GoRoute(path: RoutePaths.login, builder: _loginPageRouteBuilder),
      GoRoute(path: RoutePaths.signup, builder: _signupPageRouteBuilder),
      GoRoute(path: RoutePaths.home, builder: _homePageRouteBuilder),
      GoRoute(path: RoutePaths.terms, builder: _termsAndConditionsPageRouteBuilder),
      GoRoute(path: RoutePaths.profile, builder: _profilePageRouteBuilder),
      GoRoute(path: RoutePaths.changeEmail, builder: _changeEmailPageRouteBuilder),
      GoRoute(path: RoutePaths.myCars, builder: _myCarsPageRouteBuilder),
      GoRoute(path: RoutePaths.addCar, builder: _addCarPageRouteBuilder),
      GoRoute(path: RoutePaths.bookings, builder: _bookingsPageRouteBuilder),
      GoRoute(path: RoutePaths.adminDashboard, builder: _adminDashboardRouteBuilder),
      GoRoute(path: RoutePaths.rentCar, builder: _rentCarRouteBuilder),
      GoRoute(path: RoutePaths.adminCars, builder: _adminCarsRouteBuilder),
      GoRoute(path: RoutePaths.editCar, builder: _editCarRouteBuilder),
    ]
  );

  static GoRouter get router => _router;
}