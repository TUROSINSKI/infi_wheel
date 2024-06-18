import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:infi_wheel/features/authentication/domain/entities/user.dart';
import 'package:infi_wheel/features/authentication/domain/usecases/getuser_usecase.dart';

part 'get_user_event.dart';
part 'get_user_state.dart';

class GetUserBloc extends Bloc<GetUserEvent, GetUserState> {
  final GetUserUseCase getUserUseCase;

  GetUserBloc({required this.getUserUseCase}) : super(GetUserInitial()) {
    on<GetUser>(_onGetUser);
  }

  final storage = const FlutterSecureStorage();

  Future<void> _onGetUser(
    GetUser event, 
    Emitter<GetUserState> emit
  ) async {
    emit(GetUserLoading());
    final stopwatch = Stopwatch()..start();
    try {
      User? user = await getUserUseCase.call();
      final timeToDelay = const Duration(seconds: 2) - stopwatch.elapsed;
      if (timeToDelay > Duration.zero) {
        await Future.delayed(timeToDelay);
      }
      if (user != null) {
        storage.write(key: 'user_id', value: user.userId.toString());
        emit(GetUserSuccess(user));
      } else {
        emit(GetUserFailure('Failed to fetch user data.'));
      }
    } catch (e) {
      emit(GetUserFailure(e.toString()));
    }
  }
}