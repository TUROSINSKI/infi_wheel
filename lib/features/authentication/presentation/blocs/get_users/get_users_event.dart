part of 'get_users_bloc.dart';

abstract class GetUsersEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetUsers extends GetUsersEvent {}
