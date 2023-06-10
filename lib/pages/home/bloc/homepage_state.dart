part of 'homepage_bloc.dart';

class HomepageState {
  int index;
  int choose;

  HomepageState({this.index = 0, this.choose = 0});

  HomepageState copyWith({
    int? index,
    int? choose,
  }) {
    return HomepageState(
        index: index ?? this.index, choose: choose ?? this.choose);
  }
}
