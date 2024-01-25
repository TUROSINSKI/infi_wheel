import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infi_wheel/features/authentication/presentation/blocs/auth/auth_blocs.dart';
import 'package:infi_wheel/features/authentication/presentation/blocs/onboarding_providers/onboarding_blocs.dart';
import 'package:infi_wheel/features/authentication/presentation/blocs/register/register_blocs.dart';
import 'package:infi_wheel/features/map_home/domain/usecases/get_cars_usecase.dart';
import 'package:infi_wheel/features/map_home/presentation/blocs/cars/cars_bloc.dart';
import 'package:infi_wheel/injection_container.dart';

class BlocProviders {
  static List<BlocProvider> get allBlocProviders => [
        BlocProvider<OnboardingBloc>(create: (context) => OnboardingBloc()),
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
        BlocProvider<RegisterBloc>(create: (context) => RegisterBloc()),
        BlocProvider<CarsBloc>(create: (context) => getIt<CarsBloc>()),
      ];
}
