import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infi_wheel/features/cars/domain/entities/car.dart';
import 'package:infi_wheel/features/cars/domain/usecases/delete_car_usecase.dart';
import 'package:infi_wheel/features/cars/domain/usecases/get_cars_usecase.dart';
import 'package:infi_wheel/features/cars/domain/usecases/update_car_usecase.dart';
import 'package:infi_wheel/shared/widgets/toast.dart';

part 'cars_event.dart';
part 'cars_state.dart';

class CarsBloc extends Bloc<CarsEvent, CarsState> {
  final GetCarsUseCase getCarsUseCase;
  final DeleteCarUseCase deleteCarUseCase;
  final UpdateCarUseCase updateCarUseCase;

  CarsBloc({
    required this.getCarsUseCase,
    required this.deleteCarUseCase,
    required this.updateCarUseCase,
  }) : super(CarsInitial()) {
    on<FetchCarsEvent>(_onFetchCars);
    on<DeleteCarEvent>(_onDeleteCar);
    on<UpdateCarEvent>(_onUpdateCar);
  }

  Future<void> _onFetchCars(
      FetchCarsEvent event, Emitter<CarsState> emit) async {
    emit(CarsLoading());
    try {
      final cars = await getCarsUseCase.call();
      emit(CarsLoaded(cars));
    } catch (e) {
      emit(CarsError(e.toString()));
    }
  }

  Future<void> _onDeleteCar(
      DeleteCarEvent event, Emitter<CarsState> emit) async {
    emit(CarDeleting());
    try {
      await deleteCarUseCase.call(event.carId);
      final cars = await getCarsUseCase.call();
      emit(CarsLoaded(cars));
    } catch (e) {
      toastInfo(message: "Failed to delete car");
      final cars = await getCarsUseCase.call();
      emit(CarsLoaded(cars));
    }
  }

  Future<void> _onUpdateCar(UpdateCarEvent event, Emitter<CarsState> emit) async {
    emit(CarUpdating());
    try {
      await updateCarUseCase.call(event.car);
      final cars = await getCarsUseCase.call();
      emit(CarsLoaded(cars));
    } catch (e) {
      toastInfo(message: 'Car updated');
      final cars = await getCarsUseCase.call();
      emit(CarsLoaded(cars)); // Ensure the list is shown again even on error
    }
  }
}
