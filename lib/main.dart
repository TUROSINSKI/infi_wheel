import 'package:flutter/material.dart';
import 'package:infi_wheel/features/login_signup/presentation/ui/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InfiWheel',
      debugShowCheckedModeBanner: false,
      home: LoginView(),
    );
  }
}
