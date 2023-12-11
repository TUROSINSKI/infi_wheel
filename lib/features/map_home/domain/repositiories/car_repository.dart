import 'package:infi_wheel/features/map_home/domain/entities/car.dart';

abstract class CarRepository {
  Future<List<Car>> getCars();
}