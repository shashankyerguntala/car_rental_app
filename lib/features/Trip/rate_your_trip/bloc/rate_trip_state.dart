import 'package:equatable/equatable.dart';

class RateTripState extends Equatable {
  final int? selectedRating;
  final String feedback;
  final bool isSubmitting;
  final bool submitted;

  const RateTripState({
    this.selectedRating,
    this.feedback = "",
    this.isSubmitting = false,
    this.submitted = false,
  });

  RateTripState copyWith({
    int? selectedRating,
    String? feedback,
    bool? isSubmitting,
    bool? submitted,
  }) {
    return RateTripState(
      selectedRating: selectedRating ?? this.selectedRating,
      feedback: feedback ?? this.feedback,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      submitted: submitted ?? this.submitted,
    );
  }

  @override
  List<Object?> get props => [
    selectedRating,
    feedback,
    isSubmitting,
    submitted,
  ];
}
