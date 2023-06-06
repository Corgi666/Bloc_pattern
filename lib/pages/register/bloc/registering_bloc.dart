import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'registering_event.dart';
part 'registering_state.dart';

class RegisteringBloc extends Bloc<RegisteringEvent, RegisteringState> {
  RegisteringBloc() : super(const RegisteringState()) {
    //Using Bloc
    print('Using Register Bloc');
    on<UsernameEvent>(_userNameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<RePasswordEvent>(_repasswordEvent);
  }

  //on Handleder
  void _userNameEvent(UsernameEvent event, Emitter<RegisteringState> emit) {
    emit(state.copyWith(userName: event.userName));
  }

  void _emailEvent(EmailEvent event, Emitter<RegisteringState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<RegisteringState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _repasswordEvent(RePasswordEvent event, Emitter<RegisteringState> emit) {
    emit(state.copyWith(rePassword: event.rePassword));
  }
}
