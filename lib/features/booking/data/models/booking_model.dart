import 'package:infi_wheel/features/booking/domain/entities/booking.dart';
import 'package:infi_wheel/features/cars/data/models/car_model.dart';

class BookingModel {
  final int id;
  final String startDate;
  final String endDate;
  final int userId;
  final CarModel car; 
  final String? status;

  BookingModel({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.userId,
    required this.car,
    this.status,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    final bookingData = json['booking'] ?? {}; 
    return BookingModel(
      id: bookingData['id'] as int,
      startDate: bookingData['startDate'] as String,
      endDate: bookingData['endDate'] as String,
      userId: bookingData['user']['id'] as int,
      car: CarModel.fromJson(bookingData['car']),
      status: json['status'] as String?, // Parse nested car details
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'startDate': startDate,
      'endDate': endDate,
      'user': {'id': userId},
      'car': car.toJson(),
      'status': status,
    };
  }

  Booking toEntity() {
    return Booking(
      id: id,
      startDate: startDate,
      endDate: endDate,
      userId: userId,
      car: car.toEntity(),
      status: status, 
    );
  }

  factory BookingModel.fromEntity(Booking booking) {
    return BookingModel(
      id: booking.id,
      startDate: booking.startDate,
      endDate: booking.endDate,
      userId: booking.userId,
      car: CarModel.fromEntity(booking.car),
      status: booking.status,
    );
  }
}
