import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:infi_wheel/features/cars/data/models/car_model.dart';
import 'package:http/http.dart' as http;

class CarService {
  final String fetchCarsUrl = 'https://infiwheel.azurewebsites.net/Car/all';
  final String addCarUrl = 'https://infiwheel.azurewebsites.net/Car/add';
  final String deleteCarUrl = 'https://infiwheel.azurewebsites.net/Car/delete';
  final String updateCarUrl = 'https://infiwheel.azurewebsites.net/Car/update';
  final storage = FlutterSecureStorage();

  Future<List<CarModel>> fetchCars() async {
    String? jwtToken = await storage.read(key: 'jwt_token');

    if (jwtToken == null) {
      throw Exception('JWT Token not found');
    }

    print(jwtToken);

    final response = await http.get(Uri.parse(fetchCarsUrl),
        headers: {'Authorization': 'Bearer $jwtToken'});

    print(response.statusCode);

    if (response.statusCode == 200) {
      final List<dynamic> carJson = json.decode(response.body);
      return carJson.map((json) => CarModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load cars');
    }
  }

  Future<bool> addCar(CarModel car) async {
    String? jwtToken = await storage.read(key: 'jwt_token');

    if (jwtToken == null) {
      throw Exception('JWT Token not found');
    }

    final response = await http.post(
      Uri.parse(addCarUrl),
      headers: {
        'Authorization': 'Bearer $jwtToken',
        'Content-Type': 'application/json'
      },
      body: json.encode(car.toJson()),
    );

    if (response.statusCode == 201) {
      print(response.statusCode);
      return true;
    } else {
      throw Exception('Failed to add car');
    }
  }

  Future<bool> deleteCar(int id) async {
    String? jwtToken = await storage.read(key: 'jwt_token');

    if (jwtToken == null) {
      throw Exception('JWT Token not found');
    }

    final response = await http.delete(
      Uri.parse('$deleteCarUrl/$id'),
      headers: {
        'Authorization': 'Bearer $jwtToken',
      },
    );

    print(response.statusCode);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to delete car');
    }
  }

  Future<bool> updateCar(CarModel car) async {
    String? jwtToken = await storage.read(key: 'jwt_token');

    if (jwtToken == null) {
      throw Exception('JWT Token not found');
    }

    final response = await http.put(
      Uri.parse(updateCarUrl),
      headers: {
        'Authorization': 'Bearer $jwtToken',
        'Content-Type': 'application/json'
      },
      body: json.encode(car.toJson()),
    );

    if (response.statusCode == 200) {
      print(response.statusCode);
      return true;
    } else {
      throw Exception('Failed to update car');
    }
  }
}
