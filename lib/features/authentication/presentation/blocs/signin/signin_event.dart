part of 'signin_bloc.dart';

abstract class SigninEvent extends Equatable {

  @override
  List<Object> get props => [];
}

class SigninSubmitted extends SigninEvent {
  final String username;
  final String password;

  SigninSubmitted(this.username, this.password);

  @override
  List<Object> get props => [username, password];
}
