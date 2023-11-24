class AuthState {
  final String email;
  final String password;
  const AuthState({this.email = '', this.password = ''});

  AuthState copyWith({String? email, String? password}) {
    return AuthState(
      email: email??this.email,
      password: password??this.password
    );
  }
}
