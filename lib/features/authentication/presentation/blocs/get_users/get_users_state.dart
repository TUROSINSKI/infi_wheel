part of 'get_users_bloc.dart';

abstract class GetUsersState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetUsersInitial extends GetUsersState {}

class GetUsersLoading extends GetUsersState {}

class GetUsersSuccess extends GetUsersState {
  final List<User> users;

  GetUsersSuccess(this.users);

  @override
  List<Object?> get props => [users];
}

class GetUsersFailure extends GetUsersState {
  final String error;

  GetUsersFailure(this.error);

  @override
  List<Object?> get props => [error];
}
