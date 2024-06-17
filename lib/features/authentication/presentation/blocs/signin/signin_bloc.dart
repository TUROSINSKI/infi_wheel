import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infi_wheel/features/authentication/domain/usecases/signin_usecase.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final SigninUseCase signinUseCase;

  SigninBloc({required this.signinUseCase}) : super(SigninInitial()) {
    on<SigninSubmitted>(_onSigninSubmitted);
  }

  Future<void> _onSigninSubmitted(
    SigninSubmitted event, Emitter<SigninState> emit) async {
      emit(SigninLoading());
      final stopwatch = Stopwatch()..start();
      try {
        bool success = await signinUseCase(event.username, event.password);
        final timeToDelay = const Duration(seconds: 2) - stopwatch.elapsed;
        if (timeToDelay > Duration.zero){
          await Future.delayed(timeToDelay);
        }
        if (success) {
          emit(SigninSuccess());
        } else {
          emit(SigninFailure("Signup failed with response code other than 200."));
        }
      } catch (e) {
        emit(SigninFailure(e.toString()));
      }
    }
}
