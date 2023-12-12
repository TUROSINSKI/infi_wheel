import 'package:equatable/equatable.dart';
import 'package:infi_wheel/features/map_home/domain/entities/user_entity.dart';

class UserModel extends Equatable {
  final String id;
  final String username;
  final String email;

  const UserModel({
    required this.id,
    required this.username,
    required this.email,
  });

  static const empty = UserModel(
    id: '',
    username: '',
    email: '',
  );

  UserModel copyWith({
    String? id,
    String? username,
    String? email,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
    );
  }

  bool get isEmpty => this == UserModel.empty;

  bool get isNotEmpty => this != UserModel.empty;

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      username: username,
      email: email,
    );
  }

  UserModel fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      username: entity.username,
      email: entity.email,
    );
  }

  @override
  List<Object?> get props => [id, username, email];
}
