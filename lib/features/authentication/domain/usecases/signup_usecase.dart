import 'package:infi_wheel/features/authentication/domain/entities/user.dart';
import 'package:infi_wheel/features/authentication/domain/repositories/user_repository.dart';

class SignupUseCase {
  final UserRepository userRepository;

  SignupUseCase(this.userRepository);

  Future<bool> call(User user) async {
    bool success = await userRepository.signUp(user);
    return success;
  }
}