import 'package:infi_wheel/features/cars/domain/entities/car.dart';
import 'package:infi_wheel/features/cars/domain/repositories/car_repository.dart';

class AddCarUseCase {
  final CarRepository repository;

  AddCarUseCase(this.repository);

  Future<bool> call(Car car) async {
    return await repository.addCar(car);
  }
}
