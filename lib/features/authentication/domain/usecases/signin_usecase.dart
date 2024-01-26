import 'package:infi_wheel/features/authentication/domain/repositories/user_repository.dart';

class SigninUseCase {
  final UserRepository userRepository;

  SigninUseCase(this.userRepository);

  Future<bool> call(String username, String password) async {
    bool success = await userRepository.signIn(username, password);
    return success;
  }
}