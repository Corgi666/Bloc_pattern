part of 'registering_bloc.dart';

class RegisteringState {
  final String email;
  final String userName;
  final String password;
  final String rePassword;

  const RegisteringState(
      {this.email = '',
      this.password = '',
      this.userName = '',
      this.rePassword = ''});

  RegisteringState copyWith({
    // optional named parameter
    String? email,
    String? password,
    String? userName,
    String? rePassword,
  }) {
    return RegisteringState(
      email: email ?? this.email,
      userName: userName ?? this.userName,
      password: password ?? this.password,
      rePassword: rePassword ?? this.rePassword,
    );
  }
}
