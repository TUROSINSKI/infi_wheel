import 'package:infi_wheel/features/authentication/data/models/user_model.dart';

abstract class UserRepository {
  
  Future<void> signIn(String email, String password);

  Future<void> logOut();

  Future<UserModel> signUp(UserModel userModel, String password);

  Future<void> resetPassword(String email);

  Future<void> setUserData(UserModel user);

  Future<UserModel> getUser(String userId);
}