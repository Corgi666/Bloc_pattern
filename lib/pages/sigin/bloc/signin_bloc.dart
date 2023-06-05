import 'package:appbloc/pages/sigin/bloc/signin_event.dart';
import 'package:appbloc/pages/sigin/bloc/signin_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SigInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {
    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>((event, emit) {
      print('My password is ${event.password}');
      emit(state.copyWith(password: event.password));
    });
  }

  void _emailEvent(EmailEvent event, Emitter<SignInState> emit) {
    print('My email is ${event.email}');
    emit(state.copyWith(email: event.email));
  }
}
