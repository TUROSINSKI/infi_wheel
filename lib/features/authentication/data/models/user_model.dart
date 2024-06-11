class UserModel {
  // final String ?userId;
  final String ?firstName;
  final String ?surname;
  final String email;
  final String ?username;
  final String password;
  final int ?age;
  final String ?driverLicence;
  final int ?phoneNumber;

  @override
  String toString() =>
      '$firstName, $surname, $email, $username, $password, $age, $driverLicence, $phoneNumber';

  UserModel({
    // this.userId,
    this.firstName,
    this.surname,
    required this.email,
    this.username,
    required this.password,
    this.age,
    this.driverLicence,
    this.phoneNumber,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      // userId: json['id'] as String,
      firstName: json['firstname'] as String?,
      surname: json['surname'] as String?,
      email: json['email'] as String,
      username: json['username'] as String?,
      password: json['password'] as String,
      age: json['age'] as int?,
      driverLicence: json['driver_licence'] as String?,
      phoneNumber: json['phone_number'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // 'id': userId,
      'firstname': firstName,
      'surname': surname,
      'email': email,
      'username': username,
      'password': password,
      'age': age,
      'driver_licence': driverLicence,
      'phone_number': phoneNumber,
    };
  }
}
