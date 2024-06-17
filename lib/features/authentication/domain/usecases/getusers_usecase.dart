import 'package:infi_wheel/features/authentication/domain/entities/user.dart';
import 'package:infi_wheel/features/authentication/domain/repositories/user_repository.dart';

class GetUsersUseCase {
  final UserRepository userRepository;

  GetUsersUseCase(this.userRepository);

  Future<List<User>> call() async {
    try {
      List<User> users = await userRepository.fetchUsers();
      return users;
    } catch (e) {
      return [];
    }
  }
}
