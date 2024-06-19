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
    try {
      User? user = await getUserUseCase.call();
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