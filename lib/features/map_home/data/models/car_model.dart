import 'package:json_annotation/json_annotation.dart';

part 'car_model.g.dart';

@JsonSerializable()
class CarModel {
  final int id;
  final String manufacturer;
  final String model;
  final String type;
  final String subtype;
  final String yearOfProduction;
  final String vinNumber;
  final int engineCapacity;
  final int power;
  final String fuelType;
  final String transmission;
  final int numberOfDoors;
  final int numberOfSeats;
  final String registrationPlate;
  final String registrationNumber;
  final String ac;

  @override
  String toString() =>
      '$manufacturer, $model, $type, $subtype, $yearOfProduction, $vinNumber, $engineCapacity, $power, $fuelType, $transmission, $numberOfDoors, $numberOfSeats, $registrationPlate, $registrationNumber, $ac';

  CarModel({
    required this.id,
    required this.manufacturer,
    required this.model,
    required this.type,
    required this.subtype,
    required this.yearOfProduction,
    required this.vinNumber,
    required this.engineCapacity,
    required this.power,
    required this.fuelType,
    required this.transmission,
    required this.numberOfDoors,
    required this.numberOfSeats,
    required this.registrationPlate,
    required this.registrationNumber,
    required this.ac,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) =>
      _$CarModelFromJson(json);

  Map<String, dynamic> toJson() => _$CarModelToJson(this);
}
