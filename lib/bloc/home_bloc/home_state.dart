part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class CarsLoaded extends HomeState {
  final List<Car> car;

  CarsLoaded({required this.car});
}

class NavigateToDetails extends HomeState {
  final Car car;

  NavigateToDetails({required this.car});
}

class NavigateToTripSection extends HomeState {}
