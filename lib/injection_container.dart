import 'package:get_it/get_it.dart';
import 'package:infi_wheel/features/authentication/data/repositories/user_repository_impl.dart';
import 'package:infi_wheel/features/authentication/data/services/user_service.dart';
import 'package:infi_wheel/features/authentication/domain/repositories/user_repository.dart';
import 'package:infi_wheel/features/authentication/domain/usecases/deleteuser_usecase.dart';
import 'package:infi_wheel/features/authentication/domain/usecases/getuser_usecase.dart';
import 'package:infi_wheel/features/authentication/domain/usecases/getusers_usecase.dart';
import 'package:infi_wheel/features/authentication/domain/usecases/signin_usecase.dart';
import 'package:infi_wheel/features/authentication/domain/usecases/signup_usecase.dart';
import 'package:infi_wheel/features/authentication/presentation/blocs/delete_user/delete_user_cubit.dart';
import 'package:infi_wheel/features/authentication/presentation/blocs/get_user/get_user_bloc.dart';
import 'package:infi_wheel/features/authentication/presentation/blocs/get_users/get_users_bloc.dart';
import 'package:infi_wheel/features/authentication/presentation/blocs/signin/signin_bloc.dart';
import 'package:infi_wheel/features/authentication/presentation/blocs/signup/signup_bloc.dart';
import 'package:infi_wheel/features/booking/data/repositories/booking_repository_impl.dart';
import 'package:infi_wheel/features/booking/data/services/booking_service.dart';
import 'package:infi_wheel/features/booking/domain/repositories/booking_repository.dart';
import 'package:infi_wheel/features/booking/domain/usecases/add_booking_usecase.dart';
import 'package:infi_wheel/features/booking/domain/usecases/get_users_bookings_usecase.dart';
import 'package:infi_wheel/features/booking/presentation/blocs/add_booking/add_booking_bloc.dart';
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
  getIt.registerLazySingleton<BookingService>(() => BookingService());

  // Repositories
  getIt.registerLazySingleton<CarRepository>(() => CarRepositoryImpl(getIt()));
  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(getIt()));
  getIt.registerLazySingleton<BookingRepository>(() => BookingRepositoryImpl(getIt()));

  // Use Cases
  getIt.registerFactory(() => GetCarsUseCase(getIt()));
  getIt.registerFactory(() => SignupUseCase(getIt()));
  getIt.registerFactory(() => SigninUseCase(getIt()));
  getIt.registerFactory(() => GetUserUseCase(getIt()));
  getIt.registerFactory(() => AddCarUseCase(getIt()));
  getIt.registerFactory(() => GetUsersUseCase(getIt()));
  getIt.registerFactory(() => DeleteUserUseCase(getIt()));
  getIt.registerFactory(() => AddBookingUseCase(getIt()));
  getIt.registerFactory(() => GetUserBookingsUseCase(getIt()));

  // Blocs
  getIt.registerFactory(() => CarsBloc(getCarsUseCase: getIt()));
  getIt.registerFactory(() => SignupBloc(signupUseCase: getIt()));
  getIt.registerFactory(() => SigninBloc(signinUseCase: getIt()));
  getIt.registerFactory(() => GetUserBloc(getUserUseCase: getIt()));
  getIt.registerFactory(() => AddCarBloc(addCarUseCase: getIt()));
  getIt.registerFactory(() => GetUsersBloc(getUsersUseCase: getIt()));
  getIt.registerFactory(() => DeleteUserCubit(deleteUserUseCase: getIt()));
  getIt.registerFactory(() => AddBookingBloc(addBookingUseCase: getIt(), getUserBookingsUseCase: getIt()));
}