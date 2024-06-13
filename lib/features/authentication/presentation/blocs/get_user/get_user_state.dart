part of 'get_user_bloc.dart';

abstract class GetUserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetUserInitial extends GetUserState {}

class GetUserLoading extends GetUserState {}

class GetUserSuccess extends GetUserState {
  final User user;

  GetUserSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class GetUserFailure extends GetUserState {
  final String error;

  GetUserFailure(this.error);

  @override
  List<Object?> get props => [error];
}