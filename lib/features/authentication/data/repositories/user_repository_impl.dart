import 'package:infi_wheel/features/authentication/data/models/user_model.dart';
import 'package:infi_wheel/features/authentication/data/services/user_service.dart';
import 'package:infi_wheel/features/authentication/domain/entities/user.dart';
import 'package:infi_wheel/features/authentication/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserService userService;

  UserRepositoryImpl(this.userService);

  @override
  Future<User> getUser(String userId) {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<void> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  Future<void> resetPassword(String email) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<void> setUserData(User user) {
    // TODO: implement setUserData
    throw UnimplementedError();
  }

  @override
  Future<bool> signIn(String email, String password) async {
    UserModel userModel = UserModel(email: email, password: password);

    try {
      bool success = await userService.signInUser(userModel);
      return success;
    } catch (e) {
      print('Error signing in: $e');
      return false;
    }
  }

  @override
  Future<bool> signUp(User user) async {
    UserModel userModel = UserModel(
      // userId: user.userId,
      firstName: user.firstName,
      surname: user.surname,
      email: user.email,
      username: user.username,
      password: user.password,
      age: user.age,
      driverLicence: user.driverLicence,
      phoneNumber: user.phoneNumber,
    );

    bool success = await userService.signUpUser(userModel);
    return success;
  }

  @override
  // TODO: implement user
  Stream<User?> get user => throw UnimplementedError();
}
