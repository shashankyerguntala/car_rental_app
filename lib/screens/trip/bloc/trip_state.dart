part of 'trip_bloc.dart';

@immutable
sealed class TripState {}

final class TripInitial extends TripState {}

class TripListLoaded extends TripState {
  final List<Trip> trips;
  TripListLoaded({required this.trips});
}

class NavigateToYourTrip extends TripState {
  final Car car;

  final Trip trip;
  NavigateToYourTrip({required this.car, required this.trip});
}

class TripConfirmed extends TripState {
  final Trip trip;
  TripConfirmed({required this.trip});
}

class BookingConfirmed extends TripState {}
