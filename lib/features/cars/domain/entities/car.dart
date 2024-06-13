import 'dart:ffi';

class Car {
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
  final String url;
  final double xLocation;
  final double yLocation;

  Car({
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
    required this.url,
    required this.xLocation,
    required this.yLocation,
  });
}