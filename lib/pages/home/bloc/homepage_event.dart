part of 'homepage_bloc.dart';

class HomepageEvent {}

class HomePageDot extends HomepageEvent {
  final int index;
  HomePageDot(this.index);
}

class HomePageChoose extends HomepageEvent {
  final int choose;
  HomePageChoose(this.choose);
}
