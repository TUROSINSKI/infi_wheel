// add_car_event.dart
part of 'add_car_bloc.dart';

abstract class AddCarEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddCar extends AddCarEvent {
  final Car car;

  AddCar(this.car);

  @override
  List<Object?> get props => [car];
}
