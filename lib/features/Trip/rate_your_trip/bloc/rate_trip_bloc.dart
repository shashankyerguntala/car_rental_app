import 'package:flutter_bloc/flutter_bloc.dart';
import 'rate_trip_event.dart';
import 'rate_trip_state.dart';

class RateTripBloc extends Bloc<RateTripEvent, RateTripState> {
  RateTripBloc() : super(const RateTripState()) {
    on<SelectRating>((event, emit) {
      emit(state.copyWith(selectedRating: event.rating));
    });

    on<UpdateFeedback>((event, emit) {
      emit(state.copyWith(feedback: event.feedback));
    });

    on<SubmitReview>((event, emit) async {
      emit(state.copyWith(isSubmitting: true));

      // simulate API call delay
      await Future.delayed(const Duration(seconds: 1));

      emit(state.copyWith(isSubmitting: false, submitted: true));
    });
  }
}
