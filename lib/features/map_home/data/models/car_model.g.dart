// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarModel _$CarModelFromJson(Map<String, dynamic> json) => CarModel(
      id: json['id'] as int,
      manufacturer: json['manufacturer'] as String,
      model: json['model'] as String,
      type: json['type'] as String,
      subtype: json['subtype'] as String,
      yearOfProduction: json['yearOfProduction'] as String,
      vinNumber: json['vinNumber'] as String,
      engineCapacity: json['engineCapacity'] as int,
      power: json['power'] as int,
      fuelType: json['fuelType'] as String,
      transmission: json['transmission'] as String,
      numberOfDoors: json['numberOfDoors'] as int,
      numberOfSeats: json['numberOfSeats'] as int,
      registrationPlate: json['registrationPlate'] as String,
      registrationNumber: json['registrationNumber'] as String,
      ac: json['ac'] as String,
    );

Map<String, dynamic> _$CarModelToJson(CarModel instance) => <String, dynamic>{
      'id': instance.id,
      'manufacturer': instance.manufacturer,
      'model': instance.model,
      'type': instance.type,
      'subtype': instance.subtype,
      'yearOfProduction': instance.yearOfProduction,
      'vinNumber': instance.vinNumber,
      'engineCapacity': instance.engineCapacity,
      'power': instance.power,
      'fuelType': instance.fuelType,
      'transmission': instance.transmission,
      'numberOfDoors': instance.numberOfDoors,
      'numberOfSeats': instance.numberOfSeats,
      'registrationPlate': instance.registrationPlate,
      'registrationNumber': instance.registrationNumber,
      'ac': instance.ac,
    };
