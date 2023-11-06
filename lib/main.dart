import 'package:flutter/material.dart';
import 'package:infi_wheel/screens/login_screen/login_view.dart';

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
