import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:infi_wheel/features/authentication/data/models/user_model.dart';

class UserService {
  final String signUpUrl = 'https://infiwheel.azurewebsites.net/User/register';
  final String signInUrl = 'https://infiwheel.azurewebsites.net/User/authenticate';
  final String userDataUrl = 'https://infiwheel.azurewebsites.net/User/findToken';
  final String fetchUsersUrl = 'https://infiwheel.azurewebsites.net/User/all';
  final String deleteUserUrl = 'https://infiwheel.azurewebsites.net/User/delete/{id}';
  final FlutterSecureStorage storage = FlutterSecureStorage();
  final Dio _dio = Dio();

  Future<bool> signUpUser(UserModel user) async {
    final response = await _dio.post(
      signUpUrl,
      data: user.toJson(),
      options: Options(
        headers: {'Content-Type': 'application/json'},
      ),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to sign up user');
    }
  }

  Future<bool> signInUser(UserModel user) async {
    final response = await _dio.post(
      signInUrl,
      data: user.toJson(),
      options: Options(
        headers: {'Content-Type': 'application/json'},
      ),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = response.data;
      String? token = responseBody['token'];
      String? roleName = responseBody['roleModel']?['role_name'];

      if (token != null) {
        await storage.write(key: 'jwt_token', value: token);
      } else {
        throw Exception('Token not found in API response');
      }

      print(token);

      if (roleName != null) {
        // You can store the role name or use it as needed
        // For example, storing it
        await storage.write(key: 'role_name', value: roleName);
      } else {
        throw Exception('Role name not found in API response');
      }

      return true;
    } else {
      throw Exception('Failed to sign in user');
    }
  }

  Future<UserModel?> fetchUserData() async {
    try {
      String? token = await storage.read(key: 'jwt_token');

      if (token == null) {
        throw Exception('Token not found in secure storage');
      }

      final response = await _dio.request(
        userDataUrl,
        options: Options(
          method: 'GET',
          headers: {'Content-Type': 'application/json'},
        ),
        data: {'token': token}, // Passing token in the body
      );


      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = response.data;
        print(responseBody);
        return UserModel.fromJson(responseBody);
      } else {
        throw Exception('Failed to fetch user data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching user data: $e');
    }
  }

  Future<List<UserModel>> fetchUsers() async {
    try {
      final response = await _dio.get(
        fetchUsersUrl,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );


      if (response.statusCode == 200) {
        List<dynamic> responseBody = response.data;

        // Convert the response to a list of UserModels
        List<UserModel> users = responseBody.map((user) => UserModel.fromJson(user)).toList();

        return users;
      } else {
        throw Exception('Failed to fetch users: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching users: $e');
    }
  }

  Future<bool> deleteUser(int userId) async {
  final response = await _dio.delete(
    deleteUserUrl.replaceFirst('{id}', userId.toString()),
    options: Options(
      headers: {'Content-Type': 'application/json'},
    ),
  );

  if (response.statusCode == 200) {
    return true;
  } else {
    throw Exception('Failed to delete user');
  }
}
}
