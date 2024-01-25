import 'package:infi_wheel/features/map_home/data/models/car_model.dart';

class Car {
  final String id;
  final String brand;
  final String model;
  final String productionDate;
  final String power;
  final String type;

  Car({
    required this.id,
    required this.brand,
    required this.model,
    required this.productionDate,
    required this.power,
    required this.type,
  });

  // factory Car.fromModel(CarModel model) {
  //   return Car(
  //     id: model.id,
  //     brand: model.brand,
  //     model: model.model,
  //     productionDate: model.productionDate,
  //     power: model.power,
  //     type: model.type,
  //   );
  // }
}
