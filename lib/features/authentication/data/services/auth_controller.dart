import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:infi_wheel/features/authentication/presentation/providers/auth/auth_blocs.dart';
import 'package:infi_wheel/shared/widgets/toast.dart';

class AuthController {
  final BuildContext context;

  const AuthController({required this.context});

  Future<void> handleAuth(String type) async {
    try {
      if (type == 'email') {
        final state = context.read<AuthBloc>().state;
        String email = state.email;
        String password = state.password;
        if (email.isEmpty) {
          toastInfo(message: "Fill email input");
        }
        if (password.isEmpty) {
          toastInfo(message: "Fill password input");
        }
        try {
          UserCredential credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);
          if (credential.user==null){
            print("user doesnt exist");
          }
          if (!credential.user!.emailVerified){
            toastInfo(message: "Verify your email first");
          }

          var user = credential.user;
          if (user!=null){
            toastInfo(message: "User exists");
            GoRouter.of(context).go('/home');
          }else{
            
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found'){
            toastInfo(message: "User doesn't exist");
          }else if(e.code == 'wrong-password'){
            toastInfo(message: "Wrong password");
          }else if(e.code == 'invalid-email'){
            toastInfo(message: "Correct your email");
          }
        }
      }
    } catch (e) {
      // print(e.toString());
    }
  }
}
