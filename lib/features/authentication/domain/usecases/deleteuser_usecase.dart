import 'package:infi_wheel/features/authentication/domain/repositories/user_repository.dart';

class DeleteUserUseCase {
  final UserRepository userRepository;

  DeleteUserUseCase(this.userRepository);

  Future<bool> call(int userId) async {
    try {
      return await userRepository.deleteUser(userId);
    } catch (e) {
      return false;
    }
  }
}
