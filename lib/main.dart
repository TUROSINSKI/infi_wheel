import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infi_wheel/core/theme/theme_data.dart';
import 'package:infi_wheel/features/authentication/data/repositories/auth_repository.dart';
import 'package:infi_wheel/features/authentication/presentation/providers/auth/auth_blocs.dart';
import 'package:infi_wheel/features/authentication/presentation/providers/auth/auth_states.dart';
import 'package:infi_wheel/features/authentication/presentation/providers/onboarding_providers/onboarding_blocs.dart';
import 'package:infi_wheel/features/authentication/presentation/ui/onboarding_screen.dart';
import 'package:infi_wheel/features/authentication/presentation/ui/login_screen.dart';
import 'package:infi_wheel/features/authentication/presentation/ui/sign_up.dart';
import 'package:infi_wheel/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context)=>AuthRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<OnboardingBloc>(create: (context)=>OnboardingBloc(),),
          BlocProvider<AuthBloc>(create: (context)=>AuthBloc()),
        ],
        child: MaterialApp(
          title: 'InfiWheel',
          debugShowCheckedModeBanner: false,
          theme: lightThemeData,
          darkTheme: darkThemeData,
          home: LoginScreen(),
        ),
      ),
    );
  }
}
