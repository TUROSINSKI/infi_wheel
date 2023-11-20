import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infi_wheel/features/authentication/data/repositories/auth_repository.dart';
import 'package:infi_wheel/features/authentication/presentation/providers/auth/auth_events.dart';
import 'package:infi_wheel/features/authentication/presentation/providers/auth/auth_states.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(UnAuthenticated()){
    on<SignUpRequested>((event, state) async{
      emit(Loading());
      try{
        await authRepository.signUp(email: event.email, password: event.password);
      }catch(e){
        emit(UnAuthenticated());
      }
    });
  }
  
}