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
}