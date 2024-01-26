import 'package:infi_wheel/features/authentication/domain/entities/user.dart';

abstract class UserRepository {

  Stream<User?> get user;
  
  Future<bool> signIn(String username, String password);

  Future<void> logOut();

  Future<bool> signUp(User user);

  Future<void> resetPassword(String email);

  Future<void> setUserData(User user);

  Future<User> getUser(String userId);
}