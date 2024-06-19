import 'package:infi_wheel/features/cars/data/models/car_model.dart';
import 'package:infi_wheel/features/cars/data/services/car_service.dart';
import 'package:infi_wheel/features/cars/domain/entities/car.dart';
import 'package:infi_wheel/features/cars/domain/repositories/car_repository.dart';

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
            price: model.price,
          ),
        )
        .toList();
  }

  @override
  Future<bool> addCar(Car car) async {
    var carModel = CarModel(
      id: car.id,
      manufacturer: car.manufacturer,
      model: car.model,
      type: car.type,
      subtype: car.subtype,
      yearOfProduction: car.yearOfProduction,
      vinNumber: car.vinNumber,
      engineCapacity: car.engineCapacity,
      power: car.power,
      fuelType: car.fuelType,
      transmission: car.transmission,
      numberOfDoors: car.numberOfDoors,
      numberOfSeats: car.numberOfSeats,
      registrationPlate: car.registrationPlate,
      registrationNumber: car.registrationNumber,
      ac: car.ac,
      url: car.url,
      xLocation: car.xLocation,
      yLocation: car.yLocation,
      price: car.price,
    );

    return await carService.addCar(carModel);
  }

  @override
  Future<bool> deleteCar(int id) async {
    return await carService.deleteCar(id);
  }

  @override
  Future<bool> updateCar(Car car) async {
    var carModel = CarModel.fromEntity(car);
    return await carService.updateCar(carModel);
  }
}
