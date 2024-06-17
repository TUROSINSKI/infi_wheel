import 'package:infi_wheel/features/authentication/domain/entities/user.dart';
import 'package:infi_wheel/features/authentication/domain/repositories/user_repository.dart';

class GetUserUseCase {
  final UserRepository userRepository;

  GetUserUseCase(this.userRepository);

  Future<User?> call() async {
    try {
      User user = await userRepository.getUser();
      return user;
    } catch (e) {
      return null;
    }
  }
}
