import 'package:bloc/bloc.dart';

part 'welcom_event.dart';
part 'welcom_state.dart';

class WelcomBloc extends Bloc<WelcomEvent, WelcomState> {
  WelcomBloc() : super(WelcomInitial()) {
    print('Welcome Bloc');
    on<WelcomEvent>((event, emit) {
      emit(WelcomState(page: state.page));
    });
  }
}
