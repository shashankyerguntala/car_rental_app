import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:car_rental_app/data/car_data.dart';
import 'package:car_rental_app/model/car_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<LoadCars>(loadCars);
    on<ClickedCar>(clickCar);
    on<ClickedTripSection>(clickedTripSection);
  }

  FutureOr<void> loadCars(LoadCars event, Emitter<HomeState> emit) {
    emit(CarsLoaded(car: cars));
  }

  FutureOr<void> clickCar(ClickedCar event, Emitter<HomeState> emit) {
    emit(NavigateToDetails(car: event.car));
  }

  FutureOr<void> clickedTripSection(
    ClickedTripSection event,
    Emitter<HomeState> emit,
  ) {
    emit(NavigateToTripSection());
  }
}
