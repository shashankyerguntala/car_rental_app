part of 'trip_bloc.dart';

@immutable
sealed class TripEvent {}

class AddTrip extends TripEvent {
  final Trip trip;
  AddTrip({required this.trip});
}

class LoadTrips extends TripEvent {}

class ConfirmTripClicked extends TripEvent {
  final Car car;

  final Trip trip;
  ConfirmTripClicked({required this.car, required this.trip});
}

class DateChosen extends TripEvent {
  final bool isStart;
  final DateTime date;
  DateChosen({required this.isStart, required this.date});
}

class ConfirmBookingClicked extends TripEvent {}
