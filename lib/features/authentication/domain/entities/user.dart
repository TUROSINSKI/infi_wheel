class User {
  // final String ?userId = 'empty';
  final String? firstName;
  final String? surname;
  final String email;
  final String? username;
  final String password;
  final int? age;
  final String? driverLicence;
  final int? phoneNumber;

  User({
    this.firstName = '',
    this.surname = '',
    required this.email,
    this.username,
    required this.password,
    this.age = 18,
    this.driverLicence = '',
    this.phoneNumber = 123456789,
  });
}