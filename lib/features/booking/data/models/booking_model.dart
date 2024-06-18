import 'package:infi_wheel/features/booking/domain/entities/booking.dart';

class BookingModel {
  final String startDate;
  final String endDate;
  final int userId;
  final int carId;

  BookingModel({
    required this.startDate,
    required this.endDate,
    required this.userId,
    required this.carId,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
      userId: json['user']['id'] as int,
      carId: json['car']['id'] as int,
      // Map other fields here
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'startDate': startDate,
      'endDate': endDate,
      'user': {'id': userId.toString()},
      'car': {'id': carId.toString()},
    };
  }

  Booking toEntity() {
    return Booking(
      startDate: startDate,
      endDate: endDate,
      userId: userId,
      carId: carId,
      // Map other fields here
    );
  }
}
