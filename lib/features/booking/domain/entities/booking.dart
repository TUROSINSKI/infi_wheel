import 'package:infi_wheel/features/cars/domain/entities/car.dart';

class Booking {
  final int id;
  final String startDate;
  final String endDate;
  final int userId;
  final Car car;
  final String? status;

  Booking({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.userId,
    required this.car,
    this.status,
  });
}
