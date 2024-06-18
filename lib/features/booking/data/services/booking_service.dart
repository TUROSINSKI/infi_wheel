import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:infi_wheel/features/booking/data/models/booking_model.dart';

class BookingService {
  final String addBookingUrl = 'https://infiwheel.azurewebsites.net/Bookings/add';
  final String fetchUserBookingsUrl = 'https://infiwheel.azurewebsites.net/Bookings/find_user';
  final Dio _dio = Dio();
  final FlutterSecureStorage storage = FlutterSecureStorage();

  Future<bool> addBooking(BookingModel booking) async {
    print(booking.toJson());
    String? token = await storage.read(key: 'jwt_token');
    final response = await _dio.post(
      addBookingUrl,
      data: booking.toJson(),
      options: Options(
        headers: {'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
        },
      ),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Failed to add booking');
    }
  }

  Future<List<BookingModel>> fetchUserBookings(int userId) async {
    // Retrieve the Bearer token
    String? token = await storage.read(key: 'jwt_token');
    if (token == null) {
      throw Exception('Token not found. Please login again.');
    }

    final response = await _dio.get(
      '$fetchUserBookingsUrl/$userId',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );

    if (response.statusCode == 200) {
      List<dynamic> responseData = response.data;
      return responseData.map((booking) => BookingModel.fromJson(booking)).toList();
    } else {
      throw Exception('Failed to fetch user bookings');
    }
  }
}