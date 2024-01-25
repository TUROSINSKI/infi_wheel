import 'package:get_it/get_it.dart';
import 'package:infi_wheel/features/map_home/data/repositories/car_repository_impl.dart';
import 'package:infi_wheel/features/map_home/data/services/car_service.dart';
import 'package:infi_wheel/features/map_home/domain/repositiories/car_repository.dart';
import 'package:infi_wheel/features/map_home/domain/usecases/get_cars_usecase.dart';
import 'package:infi_wheel/features/map_home/presentation/blocs/cars/cars_bloc.dart';

final getIt = GetIt.instance;

void setupLocator() {
  // Services
  getIt.registerLazySingleton<CarService>(() => CarService());

  // Repositories
  getIt.registerLazySingleton<CarRepository>(() => CarRepositoryImpl(getIt()));

  // Use Cases
  getIt.registerFactory(() => GetCarsUseCase(getIt()));

  // Blocs
  getIt.registerFactory(() => CarsBloc(getCarsUseCase: getIt()));
}