import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infi_wheel/features/map_home/domain/entities/car.dart';
import 'package:infi_wheel/features/map_home/domain/usecases/get_cars_usecase.dart';

part 'cars_event.dart';
part 'cars_state.dart';

class CarsBloc extends Bloc<CarsEvent, CarsState> {
  final GetCarsUseCase getCarsUseCase;

  CarsBloc({required this.getCarsUseCase}) : super(CarsInitial()) {
    
    on<FetchCarsEvent>(_onFetchCars);

  }

  Future<void> _onFetchCars(FetchCarsEvent event, Emitter<CarsState> emit) async {
    emit(CarsLoading());
    try {
      final cars = await getCarsUseCase.call();
      emit(CarsLoaded(cars));
    } catch (e) {
      emit(CarsError(e.toString()));
    }
  }
}
