import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infi_wheel/simple_bloc_observer.dart';
import 'package:infi_wheel/core/routes/route_config.dart';
import 'package:infi_wheel/core/theme/theme_data.dart';
import 'package:infi_wheel/injection_container.dart';
import 'package:infi_wheel/shared/bloc_providers.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocProviders.allBlocProviders,
      child: ScreenUtilInit(
        builder: (context, child)=> MaterialApp.router(
          title: 'InfiWheel',
          debugShowCheckedModeBanner: false,
          theme: lightThemeData,
          darkTheme: darkThemeData,
          routeInformationProvider: InfiWheelRouter.router.routeInformationProvider,
          routeInformationParser: InfiWheelRouter.router.routeInformationParser,
          routerDelegate: InfiWheelRouter.router.routerDelegate,
        ),
      ),
    );
  }
}
