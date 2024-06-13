import 'package:get_it/get_it.dart';
import 'package:infi_wheel/features/authentication/data/repositories/user_repository_impl.dart';
import 'package:infi_wheel/features/authentication/data/services/user_service.dart';
import 'package:infi_wheel/features/authentication/domain/repositories/user_repository.dart';
import 'package:infi_wheel/features/authentication/domain/usecases/getuser_usecase.dart';
import 'package:infi_wheel/features/authentication/domain/usecases/getusers_usecase.dart';
import 'package:infi_wheel/features/authentication/domain/usecases/signin_usecase.dart';
import 'package:infi_wheel/features/authentication/domain/usecases/signup_usecase.dart';
import 'package:infi_wheel/features/authentication/presentation/blocs/get_user/get_user_bloc.dart';
import 'package:infi_wheel/features/authentication/presentation/blocs/get_users/get_users_bloc.dart';
import 'package:infi_wheel/features/authentication/presentation/blocs/signin/signin_bloc.dart';
import 'package:infi_wheel/features/authentication/presentation/blocs/signup/signup_bloc.dart';
import 'package:infi_wheel/features/cars/data/repositories/car_repository_impl.dart';
import 'package:infi_wheel/features/cars/data/services/car_service.dart';
import 'package:infi_wheel/features/cars/domain/repositories/car_repository.dart';
import 'package:infi_wheel/features/cars/domain/usecases/add_car_usecase.dart';
import 'package:infi_wheel/features/cars/domain/usecases/get_cars_usecase.dart';
import 'package:infi_wheel/features/cars/presentation/blocs/add_car/add_car_bloc.dart';
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
  getIt.registerFactory(() => AddCarUseCase(getIt()));
  getIt.registerFactory(() => GetUsersUseCase(getIt()));

  // Blocs
  getIt.registerFactory(() => CarsBloc(getCarsUseCase: getIt()));
  getIt.registerFactory(() => SignupBloc(signupUseCase: getIt()));
  getIt.registerFactory(() => SigninBloc(signinUseCase: getIt()));
  getIt.registerFactory(() => GetUserBloc(getUserUseCase: getIt()));
  getIt.registerFactory(() => AddCarBloc(addCarUseCase: getIt()));
  getIt.registerFactory(() => GetUsersBloc(getUsersUseCase: getIt()));
}