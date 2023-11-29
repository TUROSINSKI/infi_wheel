import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infi_wheel/features/authentication/presentation/providers/auth/auth_blocs.dart';
import 'package:infi_wheel/features/authentication/presentation/providers/onboarding_providers/onboarding_blocs.dart';
import 'package:infi_wheel/features/authentication/presentation/providers/register/register_blocs.dart';

class BlocProviders {
  static get allBlocProviders => [
        BlocProvider<OnboardingBloc>(create: (context) => OnboardingBloc()),
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
        BlocProvider<RegisterBloc>(create: (context) => RegisterBloc()),
      ];
}
