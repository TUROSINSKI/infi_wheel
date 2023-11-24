import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infi_wheel/features/authentication/presentation/providers/auth/auth_blocs.dart';

class AuthController {
  final BuildContext context;

  const AuthController({required this.context});

  Future<void> handleAuth(String type) async {
    try {
      if (type == 'email') {
        final state = context.read<AuthBloc>().state;
        String email = state.email;
        String password = state.password;
        if (email.isEmpty) {}
        if (password.isEmpty) {}
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);
          if (credential.user==null){

          }
          if (!credential.user!.emailVerified){

          }

          var user = credential.user;
          if (user!=null){

          }else{
            
          }
        } catch (e) {}
      }
    } catch (e) {}
  }
}
