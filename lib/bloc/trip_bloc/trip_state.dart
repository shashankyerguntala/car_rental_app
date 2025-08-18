part of 'trip_bloc.dart';

@immutable
sealed class TripState {}

final class TripInitial extends TripState {}

class TripDatesSelected extends TripState {
  final DateTime? startDate;
  final DateTime? endDate;

  TripDatesSelected({this.startDate, this.endDate});
}

class NavigateToYourTripPage extends TripState {
  final Trip trip;

  NavigateToYourTripPage({required this.trip});
}

class TripListUpdated extends TripState {
  final List<Trip> trips;
  TripListUpdated(this.trips);
}
