import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infi_wheel/features/authentication/domain/usecases/deleteuser_usecase.dart';
import 'package:infi_wheel/features/authentication/presentation/blocs/delete_user/delete_user_state.dart';

class DeleteUserCubit extends Cubit<DeleteUserState> {
  final DeleteUserUseCase deleteUserUseCase;

  DeleteUserCubit({required this.deleteUserUseCase}) : super(DeleteUserInitial());

  Future<void> deleteUser(int userId) async {
    emit(DeleteUserLoading());
    try {
      final success = await deleteUserUseCase(userId);
      if (success) {
        emit(DeleteUserSuccess());
      } else {
        emit(DeleteUserFailure('Failed to delete user'));
      }
    } catch (e) {
      emit(DeleteUserFailure('Error deleting user: $e'));
    }
  }
}