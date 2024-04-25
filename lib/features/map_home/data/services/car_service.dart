import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:infi_wheel/features/map_home/data/models/car_model.dart';
import 'package:http/http.dart' as http;

class CarService {
  final String apiUrl = 'https://infiwheel.azurewebsites.net/Car/all';
  final storage = FlutterSecureStorage();

  Future<List<CarModel>> fetchCars() async {
    String? jwtToken = await storage.read(key: 'jwt_token');

    if (jwtToken == null) {
      throw Exception('JWT Token not found');
    }

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {'Authorization': 'Bearer $jwtToken'}
      );

    if (response.statusCode == 200) {
      final List<dynamic> carJson = json.decode(response.body);
      return carJson.map((json) => CarModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load cars');
    }
  }
}