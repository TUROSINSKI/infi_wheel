part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {

  @override
  List<Object> get props => [];
}

class SignupSubmitted extends SignupEvent {
  final User user;

  SignupSubmitted(this.user);

  @override
  List<Object> get props => [user];
}
