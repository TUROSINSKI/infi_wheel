import 'package:infi_wheel/features/map_home/data/services/car_service.dart';
import 'package:infi_wheel/features/map_home/domain/entities/car.dart';
import 'package:infi_wheel/features/map_home/domain/repositiories/car_repository.dart';

class CarRepositoryImpl implements CarRepository {
  final CarService carService;

  CarRepositoryImpl(this.carService);

  @override
  Future<List<Car>> getCars() async {
    var carModels = await carService.fetchCars();
    return carModels
        .map(
          (model) => Car(
            id: model.id,
            manufacturer: model.manufacturer,
            model: model.model,
            type: model.type,
            subtype: model.subtype,
            yearOfProduction: model.yearOfProduction,
            vinNumber: model.vinNumber,
            engineCapacity: model.engineCapacity,
            power: model.power,
            fuelType: model.fuelType,
            transmission: model.transmission,
            numberOfDoors: model.numberOfDoors,
            numberOfSeats: model.numberOfSeats,
            registrationPlate: model.registrationPlate,
            registrationNumber: model.registrationNumber,
            ac: model.ac,
            url: model.url,
            xLocation: model.xLocation,
            yLocation: model.yLocation,
          ),
        )
        .toList();
  }
}
