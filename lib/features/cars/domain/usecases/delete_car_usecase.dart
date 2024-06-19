import 'package:infi_wheel/features/cars/domain/repositories/car_repository.dart';

class DeleteCarUseCase {
  final CarRepository repository;

  DeleteCarUseCase(this.repository);

  Future<bool> call(int id) async {
    return await repository.deleteCar(id);
  }
}