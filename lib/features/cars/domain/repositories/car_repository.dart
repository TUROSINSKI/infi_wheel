import 'package:infi_wheel/features/cars/domain/entities/car.dart';

abstract class CarRepository {
  Future<List<Car>> getCars();

  Future<bool> addCar(Car car);
}