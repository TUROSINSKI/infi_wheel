import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:infi_wheel/features/authentication/presentation/blocs/register/register_blocs.dart';
import 'package:infi_wheel/shared/widgets/toast.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;
    String username = state.username;
    String email = state.email;
    String password = state.password;
    String confirmPassword = state.confirmPassword;

    if(username.isEmpty){
      toastInfo(message: "Fill username field");
      return;
    }
    if(email.isEmpty){
      toastInfo(message: "Fill email field");
      return;
    }
    if(password.isEmpty){
      toastInfo(message: "Fill password field");
      return;
    }
    if(confirmPassword.isEmpty){
      toastInfo(message: "Confirm ur password");
      return;
    }

    try{
      UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

      if(credential.user!=null){
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(username);
        toastInfo(message: "We sent a verification link to your email. To activate account, please follow the steps.");
        GoRouter.of(context).go('/login');
      }
    }on FirebaseAuthException catch(e) {
      if (e.code == 'weak-password'){
        toastInfo(message: "Password is too weak");
      }else if (e.code == 'email-already-in-use'){
        toastInfo(message: "Email is already in use");
      }else if (e.code == 'invalid-email'){
        toastInfo(message: "Ur email is invalid");
      }
    }
  }
}