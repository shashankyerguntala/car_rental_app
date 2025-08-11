import 'package:car_rental_app/model/car_model.dart';
import 'package:car_rental_app/model/trip_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'trip_event.dart';
part 'trip_state.dart';

class TripBloc extends Bloc<TripEvent, TripState> {
  List<Trip> tripList = [];

  TripBloc() : super(TripInitial()) {
    on<LoadTrips>((event, emit) {
      emit(TripListLoaded(trips: tripList));
    });

    on<ConfirmTripClicked>((event, emit) {
      tripList.add(event.trip);

      emit(NavigateToYourTrip(trip: event.trip, car: event.car));

      emit(TripListLoaded(trips: tripList));
    });
  }
}
