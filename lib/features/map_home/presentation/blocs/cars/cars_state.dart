part of 'cars_bloc.dart';

abstract class CarsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CarsInitial extends CarsState {}

class CarsLoading extends CarsState {}

class CarsLoaded extends CarsState {
  final List<Car> cars;

  CarsLoaded(this.cars);

  @override
  List<Object?> get props => [cars];
}

class CarsError extends CarsState {
  final String message;

  CarsError(this.message);

  @override
  List<Object?> get props => [message];
}
