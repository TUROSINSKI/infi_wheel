import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:infi_wheel/features/authentication/data/models/user_model.dart';

class UserService {
  final String signUpUrl = 'https://infiwheel.azurewebsites.net/User/add';
  final String signInUrl = 'https://infiwheel.azurewebsites.net/User/login';

  Future<bool> signUpUser(UserModel user) async {
    final response = await http.post(
      Uri.parse(signUpUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Failed to sign up user');
    }
  }

  Future<bool> signInUser(UserModel user) async {
    final response = await http.post(
      Uri.parse(signInUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Failed to sign in user');
    }
  }
}