import 'dart:convert';

import 'package:infi_wheel/features/map_home/data/models/car_model.dart';
import 'package:http/http.dart' as http;

class CarService {
  final String apiUrl = 'https://infiwheel.azurewebsites.net/Car/all';

  Future<List<CarModel>> fetchCars() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> carJson = json.decode(response.body);
      return carJson.map((json) => CarModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load cars');
    }
  }
}