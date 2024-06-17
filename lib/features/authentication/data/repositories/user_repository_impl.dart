import 'package:infi_wheel/features/authentication/data/models/user_model.dart';
import 'package:infi_wheel/features/authentication/data/services/user_service.dart';
import 'package:infi_wheel/features/authentication/domain/entities/user.dart';
import 'package:infi_wheel/features/authentication/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserService userService;

  UserRepositoryImpl(this.userService);

  @override
  Future<User> getUser() async {
    try {
      UserModel? userModel = await userService.fetchUserData();
      if (userModel != null) {
        return _mapUserModelToUser(userModel);
      } else {
        throw Exception('User not found');
      }
    } catch (e) {
      throw Exception('Error fetching user: $e');
    }
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

  @override
  Future<List<User>> fetchUsers() async {
    try {
      List<UserModel> userModels = await userService.fetchUsers();
      List<User> users = userModels.map(_mapUserModelToUser).toList();
      return users;
    } catch (e) {
      throw Exception('Error fetching users: $e');
    }
  }

  @override
  Future<bool> deleteUser(int userId) async {
    try {
      return await userService.deleteUser(userId);
    } catch (e) {
      throw Exception('Error deleting user: $e');
    }
  }

  User _mapUserModelToUser(UserModel userModel) {
    return User(
      userId: userModel.userId,
      firstName: userModel.firstName,
      surname: userModel.surname,
      email: userModel.email,
      username: userModel.username,
      password: userModel.password,
      age: userModel.age,
      driverLicence: userModel.driverLicence,
      phoneNumber: userModel.phoneNumber,
    );
  }
}
