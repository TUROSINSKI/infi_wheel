import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:infi_wheel/features/authentication/data/models/user_model.dart';

class UserService {
  final String signUpUrl = 'https://infiwheel.azurewebsites.net/User/register';
  final String signInUrl = 'https://infiwheel.azurewebsites.net/User/authenticate';

  Future<bool> signUpUser(UserModel user) async {
    final response = await http.post(
      Uri.parse(signUpUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to sign up user');
    }
  }

  final storage = FlutterSecureStorage();

  Future<bool> signInUser(UserModel user) async {
    final response = await http.post(
      Uri.parse(signInUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = json.decode(response.body);
      String? token = responseBody['token'];

      if (token != null) {
        print(token);
        await storage.write(key: 'jwt_token', value: token);
      } else {
        throw Exception('Token not found in API response');
      }

      return true;
    } else {
      throw Exception('Failed to sign in user');
    }
  }
}