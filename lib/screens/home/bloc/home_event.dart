part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class LoadCars extends HomeEvent {}

class ClickedCar extends HomeEvent {
  final Car car;

  ClickedCar({required this.car});
}
