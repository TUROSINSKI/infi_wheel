// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      userCode: json['userCode'] as String,
      firstName: json['firstName'] as String,
      surname: json['surname'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      age: json['age'] as int,
      driverLicence: json['driverLicence'] as String,
      phoneNumber: json['phoneNumber'] as int,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'userCode': instance.userCode,
      'firstName': instance.firstName,
      'surname': instance.surname,
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
      'age': instance.age,
      'driverLicence': instance.driverLicence,
      'phoneNumber': instance.phoneNumber,
    };
