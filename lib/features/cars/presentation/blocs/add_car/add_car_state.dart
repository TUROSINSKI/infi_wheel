// add_car_state.dart
part of 'add_car_bloc.dart';

abstract class AddCarState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddCarInitial extends AddCarState {}

class AddCarLoading extends AddCarState {}

class AddCarSuccess extends AddCarState {}

class AddCarFailure extends AddCarState {
  final String error;

  AddCarFailure(this.error);

  @override
  List<Object?> get props => [error];
}
