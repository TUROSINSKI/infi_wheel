
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
  final String url;
  final double xLocation;
  final double yLocation;

  @override
  String toString() =>
      '$manufacturer, $model, $type, $subtype, $yearOfProduction, $vinNumber, $engineCapacity, $power, $fuelType, $transmission, $numberOfDoors, $numberOfSeats, $registrationPlate, $registrationNumber, $ac, $url, $xLocation, $yLocation';

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
    required this.url,
    required this.xLocation,
    required this.yLocation,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'] as int,
      manufacturer: json['manufacturer'] as String,
      model: json['model'] as String,
      type: json['type'] as String,
      subtype: json['subtype'] as String,
      yearOfProduction: json['year_of_production'] as String,
      engineCapacity: json['engine_capacity'] as int,
      power: json['power'] as int,
      fuelType: json['fuel_type'] as String,
      transmission: json['transmission'] as String,
      numberOfDoors: json['number_of_doors'] as int,
      numberOfSeats: json['number_of_seats'] as int,
      registrationPlate: json['registration_plate'] as String,
      registrationNumber: json['registration_number'] as String,
      ac: json['ac'] as String,
      vinNumber: json['vin_number'] as String,
      url: json['url'] as String,
      xLocation: json['x_location'] as double,
      yLocation: json['y_location'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'manufacturer': manufacturer,
      'model': model,
      'type': type,
      'subtype': subtype,
      'year_of_production': yearOfProduction,
      'engine_capacity': engineCapacity,
      'power': power,
      'fuel_type': fuelType,
      'transmission': transmission,
      'number_of_doors': numberOfDoors,
      'number_of_seats': numberOfSeats,
      'registration_plate': registrationPlate,
      'registration_number': registrationNumber,
      'ac': ac,
      'vin_number': vinNumber,
      'url': url,
      'x_location': xLocation,
      'y_location': yLocation,
    };
  }
}
