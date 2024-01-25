import 'package:infi_wheel/features/map_home/domain/entities/car.dart';
import 'package:infi_wheel/features/map_home/domain/repositiories/car_repository.dart';

class GetCarsUseCase {
  final CarRepository repository;

  GetCarsUseCase(this.repository);

  Future<List<Car>> call() async {
    return await repository.getCars();
  }
}