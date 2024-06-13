// add_car_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infi_wheel/features/cars/domain/entities/car.dart';
import 'package:infi_wheel/features/cars/domain/usecases/add_car_usecase.dart';

part 'add_car_event.dart';
part 'add_car_state.dart';

class AddCarBloc extends Bloc<AddCarEvent, AddCarState> {
  final AddCarUseCase addCarUseCase;

  AddCarBloc({required this.addCarUseCase}) : super(AddCarInitial()) {
    on<AddCar>(_onAddCar);
  }

  Future<void> _onAddCar(
    AddCar event,
    Emitter<AddCarState> emit,
  ) async {
    emit(AddCarLoading());
    try {
      bool success = await addCarUseCase.call(event.car);
      if (success) {
        emit(AddCarSuccess());
      } else {
        emit(AddCarFailure('Failed to add car.'));
      }
    } catch (e) {
      emit(AddCarFailure(e.toString()));
    }
  }
}
