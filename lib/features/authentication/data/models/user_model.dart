import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String userCode;
  final String firstName;
  final String surname;
  final String email;
  final String username;
  final String password;
  final int age;
  final String driverLicence;
  final int phoneNumber;

  @override
  String toString() =>
      '$userCode, $firstName, $surname, $email, $username, $password, $age, $driverLicence, $phoneNumber';

  UserModel({
    required this.userCode,
    required this.firstName,
    required this.surname,
    required this.email,
    required this.username,
    required this.password,
    required this.age,
    required this.driverLicence,
    required this.phoneNumber,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
