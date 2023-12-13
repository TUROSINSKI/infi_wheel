import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String username;
  final String email;

  const UserEntity({
    required this.id,
    required this.username,
    required this.email,
  });

  Map<String, Object?> toDocument() {
    return {'id': id, 'username': username, 'email': email};
  }

  static UserEntity fromDocument(Map<String, dynamic> doc) {
    return UserEntity(
      id: doc['id'] as String,
      username: doc['username'] as String,
      email: doc['email'] as String,
    );
  }

  @override
  List<Object?> get props => [id, username, email];

  @override
  String toString() {
    return '''UserEntity: {
      id: $id
      username: $username
      email: $email
    }''';
  }
}
