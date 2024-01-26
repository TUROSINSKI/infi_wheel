class User {
  final String ?userCode = 'empty';
  final String ?firstName = 'empty';
  final String ?surname = 'empty';
  final String ?email;
  final String username;
  final String password;
  final int ?age = 18;
  final String ?driverLicence = 'empty';
  final int ?phoneNumber = 123456789;

  // User({
  //   this.userCode,
  //   this.firstName,
  //   this.surname,
  //   required this.email,
  //   required this.username,
  //   required this.password,
  //   this.age,
  //   this.driverLicence,
  //   this.phoneNumber,
  // });

  User({
    this.email,
    required this.username,
    required this.password,
  });
}
