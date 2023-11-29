import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infi_wheel/features/authentication/presentation/providers/register/register_events.dart';
import 'package:infi_wheel/features/authentication/presentation/providers/register/register_states.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState>{
  RegisterBloc():super(const RegisterState()){
    on<UsernameEvent>(_usernameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<ConfirmPasswordEvent>(_confirmPasswordEvent);
  }

  void _usernameEvent(UsernameEvent event, Emitter<RegisterState> emit){
    print("${event.username}");
    emit(state.copyWith(username: event.username));
  }

  void _emailEvent(EmailEvent event, Emitter<RegisterState> emit){
    print("${event.email}");
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<RegisterState> emit){
    print("${event.password}");
    emit(state.copyWith(password: event.password));
  }

  void _confirmPasswordEvent(ConfirmPasswordEvent event, Emitter<RegisterState> emit){
    print("${event.confirmPassword}");
    emit(state.copyWith(confirmPassword: event.confirmPassword));
  }
}