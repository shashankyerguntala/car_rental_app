part of 'trip_bloc.dart';

@immutable
sealed class TripEvent {}

class PickStartDate extends TripEvent {
  final DateTime date;
  PickStartDate(this.date);
}

class PickEndDate extends TripEvent {
  final DateTime date;
  PickEndDate(this.date);
}

class ClickedConfirmTrip extends TripEvent {
  final Trip trip;

  ClickedConfirmTrip({required this.trip});
}
