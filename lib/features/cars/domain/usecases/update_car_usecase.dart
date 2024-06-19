import 'package:infi_wheel/features/cars/domain/entities/car.dart';
import 'package:infi_wheel/features/cars/domain/repositories/car_repository.dart';

class UpdateCarUseCase {
  final CarRepository repository;

  UpdateCarUseCase(this.repository);

  Future<bool> call(Car car) async {
    return await repository.updateCar(car);
  }
}
