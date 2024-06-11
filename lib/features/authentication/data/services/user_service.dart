// import 'dart:convert';

// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:http/http.dart' as http;
// import 'package:infi_wheel/features/authentication/data/models/user_model.dart';

// class UserService {
//   final String signUpUrl = 'https://infiwheel.azurewebsites.net/User/register';
//   final String signInUrl = 'https://infiwheel.azurewebsites.net/User/authenticate';
//   final String getUserDataUrl = "https://infiwheel.azurewebsites.net/User/findToken";

//   Future<bool> signUpUser(UserModel user) async {
//     final response = await http.post(
//       Uri.parse(signUpUrl),
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode(user.toJson()),
//     );

//     if (response.statusCode == 200) {
//       return true;
//     } else {
//       throw Exception('Failed to sign up user');
//     }
//   }

//   final storage = FlutterSecureStorage();

//   Future<bool> signInUser(UserModel user) async {
//     final response = await http.post(
//       Uri.parse(signInUrl),
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode(user.toJson()),
//     );

//     if (response.statusCode == 200) {
//       Map<String, dynamic> responseBody = json.decode(response.body);
//       String? token = responseBody['token'];

//       if (token != null) {
//         print(token);
//         await storage.write(key: 'jwt_token', value: token);
//       } else {
//         throw Exception('Token not found in API response');
//       }

//       return true;
//     } else {
//       throw Exception('Failed to sign in user');
//     }
//   }

//   Future<UserModel?> fetchUserData() async {
//     try {
//       String? token = await storage.read(key: 'jwt_token');
//       print('Retrieved token: $token');

//       if (token == null) {
//         throw Exception('Token not found in secure storage');
//       }

//       final response = await http.get(
//         Uri.parse(getUserDataUrl),
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Content-Type': 'application/json',
//         },
//       );

//       print('API Response: ${response.statusCode}, ${response.body}');

//       if (response.statusCode == 200) {
//         Map<String, dynamic> responseBody = json.decode(response.body);
//         print('Parsed Response: $responseBody');
//         return UserModel.fromJson(responseBody);
//       } else {
//         throw Exception('Failed to fetch user data');
//       }
//     } catch (e) {
//       throw Exception('Error fetching user data: $e');
//     }
//   }
// }
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:infi_wheel/features/authentication/data/models/user_model.dart';

class UserService {
  final String signUpUrl = 'https://infiwheel.azurewebsites.net/User/register';
  final String signInUrl = 'https://infiwheel.azurewebsites.net/User/authenticate';
  final String userDataUrl = 'https://infiwheel.azurewebsites.net/User/findToken';
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

  Future<UserModel?> fetchUserData() async {
    try {
      String? token = await storage.read(key: 'jwt_token');
      print('Retrieved token: $token');

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

      print('API Response: ${response.statusCode}, ${response.data}');

      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = response.data;
        print('Parsed Response: $responseBody');
        return UserModel.fromJson(responseBody);
      } else {
        print('Failed to fetch user data: ${response.statusCode}');
        throw Exception('Failed to fetch user data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching user data: $e');
      throw Exception('Error fetching user data: $e');
    }
  }
}
