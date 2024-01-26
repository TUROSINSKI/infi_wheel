part of 'signin_bloc.dart';

abstract class SigninState extends Equatable {
  
  @override
  List<Object> get props => [];
}

class SigninInitial extends SigninState {}

class SigninLoading extends SigninState {}

class SigninSuccess extends SigninState {}

class SigninFailure extends SigninState {
  final String error;

  SigninFailure(this.error);

  @override
  List<Object> get props => [error];
}
