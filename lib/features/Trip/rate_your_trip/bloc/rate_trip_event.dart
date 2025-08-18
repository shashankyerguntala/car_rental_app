import 'package:equatable/equatable.dart';

abstract class RateTripEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SelectRating extends RateTripEvent {
  final int rating;
  SelectRating(this.rating);

  @override
  List<Object?> get props => [rating];
}

class UpdateFeedback extends RateTripEvent {
  final String feedback;
  UpdateFeedback(this.feedback);

  @override
  List<Object?> get props => [feedback];
}

class SubmitReview extends RateTripEvent {}
