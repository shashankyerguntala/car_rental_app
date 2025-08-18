import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:car_rental_app/model/trip_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'trip_event.dart';
part 'trip_state.dart';

class TripBloc extends Bloc<TripEvent, TripState> {
  DateTime? startDate;
  DateTime? endDate;
  List<Trip> trips = [];

  TripBloc() : super(TripInitial()) {
    on<TripEvent>((event, emit) {});
    on<PickStartDate>(pickedStartDate);
    on<PickEndDate>(pickedEndDate);
    on<ClickedConfirmTrip>(clickedConfirmTrip);
  }

  FutureOr<void> pickedStartDate(PickStartDate event, Emitter<TripState> emit) {
    startDate = event.date;
    emit(TripDatesSelected(startDate: startDate, endDate: endDate));
  }

  FutureOr<void> pickedEndDate(PickEndDate event, Emitter<TripState> emit) {
    endDate = event.date;
    emit(TripDatesSelected(startDate: startDate, endDate: endDate));
  }

  FutureOr<void> clickedConfirmTrip(
    ClickedConfirmTrip event,
    Emitter<TripState> emit,
  ) {
    trips.add(event.trip);
    emit(TripListUpdated(trips));
    emit(NavigateToYourTripPage(trip: event.trip));
  }
}
