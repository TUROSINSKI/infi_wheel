import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infi_wheel/features/authentication/presentation/blocs/onboarding_providers/onboarding_blocs.dart';
import 'package:infi_wheel/features/authentication/presentation/blocs/signup/signup_bloc.dart';
import 'package:infi_wheel/features/map_home/presentation/blocs/cars/cars_bloc.dart';
import 'package:infi_wheel/injection_container.dart';

class BlocProviders {
  static List<BlocProvider> get allBlocProviders => [
        BlocProvider<OnboardingBloc>(create: (context) => OnboardingBloc()),
        BlocProvider<CarsBloc>(create: (context) => getIt<CarsBloc>()),
        BlocProvider<SignupBloc>(create: (context) => getIt<SignupBloc>()),
      ];
}
