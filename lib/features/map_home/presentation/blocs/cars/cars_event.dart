part of 'cars_bloc.dart';

abstract class CarsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchCarsEvent extends CarsEvent {}
