part of 'registering_bloc.dart';

@immutable
abstract class RegisteringEvent {
  const RegisteringEvent();
}

class UsernameEvent extends RegisteringEvent {
  final String userName;
  const UsernameEvent(this.userName);
}

class EmailEvent extends RegisteringEvent {
  final String email;
  const EmailEvent(this.email);
}

class PasswordEvent extends RegisteringEvent {
  final String password;
  const PasswordEvent(this.password);
}

class RePasswordEvent extends RegisteringEvent {
  final String rePassword;
  const RePasswordEvent(this.rePassword);
}
