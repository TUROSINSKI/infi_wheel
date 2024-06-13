import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infi_wheel/features/authentication/domain/entities/user.dart';
import 'package:infi_wheel/features/authentication/domain/usecases/getusers_usecase.dart';

part 'get_users_event.dart';
part 'get_users_state.dart';

class GetUsersBloc extends Bloc<GetUsersEvent, GetUsersState> {
  final GetUsersUseCase getUsersUseCase;

  GetUsersBloc({required this.getUsersUseCase}) : super(GetUsersInitial()) {
    on<GetUsers>(_onGetUsers);
  }

  Future<void> _onGetUsers(
    GetUsers event, 
    Emitter<GetUsersState> emit
  ) async {
    emit(GetUsersLoading());
    try {
      List<User> users = await getUsersUseCase.call();
      emit(GetUsersSuccess(users));
    } catch (e) {
      emit(GetUsersFailure(e.toString()));
    }
  }
}
