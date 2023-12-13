import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

import 'package:infi_wheel/features/authentication/data/models/user_model.dart';

import 'package:infi_wheel/features/authentication/domain/repositories/user_repository.dart';


part 'user_event.dart';

part 'user_state.dart';


class UserBloc extends Bloc<UserEvent, UserState> {

  final UserRepository _userRepository;


  UserBloc({required UserRepository userRepo})
      : _userRepository = userRepo,
      super(const UserState.loading()) {

    on<GetUser>((event, emit) async {
      try {
        UserModel user = await _userRepository.getUser(event.userId);
        emit(UserState.success(user));
      } catch (e) {
        log(e.toString());
        emit(const UserState.failure());
      }
    });

  }

}

