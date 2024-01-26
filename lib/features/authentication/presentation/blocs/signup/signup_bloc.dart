import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infi_wheel/features/authentication/domain/entities/user.dart';
import 'package:infi_wheel/features/authentication/domain/usecases/signup_usecase.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignupUseCase signupUseCase;

  SignupBloc({required this.signupUseCase}) : super(SignupInitial()) {
    on<SignupSubmitted>(_onSignupSubmitted);
  }

  Future<void> _onSignupSubmitted(
    SignupSubmitted event, Emitter<SignupState> emit) async {
      emit(SignupLoading());
      try {
        bool success = await signupUseCase(event.user);
        if (success) {
          emit(SignupSuccess());
        } else {
          emit(SignupFailure("Signup failed with response code other than 200."));
        }
      } catch (e) {
        print('Sign up failed: $e');
        emit(SignupFailure(e.toString()));
      }
    }
  
}
