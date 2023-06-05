abstract class SigInEvent{
  const SigInEvent();
}

class EmailEvent extends SigInEvent{
  final String email;
  const EmailEvent(this.email);
}

class PasswordEvent extends SigInEvent{
  final String password;
  const PasswordEvent(this.password);
}