import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  HomepageBloc() : super(HomepageState()) {
    on<HomePageDot>(_homePageDots);
    on<HomePageChoose>(_homePageChoose);
  }
  void _homePageDots(HomePageDot event, Emitter<HomepageState> emit) {
    emit(state.copyWith(index: event.index));
  }

  void _homePageChoose(HomePageChoose event, Emitter<HomepageState> emit) {
    emit(state.copyWith(choose: event.choose));
  }
}
