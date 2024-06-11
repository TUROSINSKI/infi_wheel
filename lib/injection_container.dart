import 'package:get_it/get_it.dart';
import 'package:infi_wheel/features/authentication/data/repositories/user_repository_impl.dart';
import 'package:infi_wheel/features/authentication/data/services/user_service.dart';
import 'package:infi_wheel/features/authentication/domain/repositories/user_repository.dart';
import 'package:infi_wheel/features/authentication/domain/usecases/getuser_usecase.dart';
import 'package:infi_wheel/features/authentication/domain/usecases/signin_usecase.dart';
import 'package:infi_wheel/features/authentication/domain/usecases/signup_usecase.dart';
import 'package:infi_wheel/features/authentication/presentation/blocs/bloc/get_user_bloc.dart';
import 'package:infi_wheel/features/authentication/presentation/blocs/signin/signin_bloc.dart';
import 'package:infi_wheel/features/authentication/presentation/blocs/signup/signup_bloc.dart';
import 'package:infi_wheel/features/map_home/data/repositories/car_repository_impl.dart';
import 'package:infi_wheel/features/map_home/data/services/car_service.dart';
import 'package:infi_wheel/features/map_home/domain/repositiories/car_repository.dart';
import 'package:infi_wheel/features/map_home/domain/usecases/get_cars_usecase.dart';
import 'package:infi_wheel/features/map_home/presentation/blocs/cars/cars_bloc.dart';

final getIt = GetIt.instance;

void setupLocator() {
  // Services
  getIt.registerLazySingleton<CarService>(() => CarService());
  getIt.registerLazySingleton<UserService>(() => UserService());

  // Repositories
  getIt.registerLazySingleton<CarRepository>(() => CarRepositoryImpl(getIt()));
  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(getIt()));

  // Use Cases
  getIt.registerFactory(() => GetCarsUseCase(getIt()));
  getIt.registerFactory(() => SignupUseCase(getIt()));
  getIt.registerFactory(() => SigninUseCase(getIt()));
  getIt.registerFactory(() => GetUserUseCase(getIt()));

  // Blocs
  getIt.registerFactory(() => CarsBloc(getCarsUseCase: getIt()));
  getIt.registerFactory(() => SignupBloc(signupUseCase: getIt()));
  getIt.registerFactory(() => SigninBloc(signinUseCase: getIt()));
  getIt.registerFactory(() => GetUserBloc(getUserUseCase: getIt()));
}