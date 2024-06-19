part of 'cars_bloc.dart';

abstract class CarsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchCarsEvent extends CarsEvent {}

class DeleteCarEvent extends CarsEvent {
  final int carId;

  DeleteCarEvent(this.carId);

  @override
  List<Object> get props => [carId];
}

class UpdateCarEvent extends CarsEvent {
  final Car car;

  UpdateCarEvent(this.car);

  @override
  List<Object> get props => [car];
}