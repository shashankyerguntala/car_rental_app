import 'package:car_rental_app/features/Trip/rate_your_trip/bloc/rate_trip_bloc.dart';
import 'package:car_rental_app/features/Trip/rate_your_trip/bloc/rate_trip_event.dart';
import 'package:car_rental_app/features/Trip/rate_your_trip/bloc/rate_trip_state.dart';
import 'package:car_rental_app/model/trip_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class RateYourTripScreen extends StatelessWidget {
  final Trip trip;

  const RateYourTripScreen({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RateTripBloc(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            "Rate your trip",
            style: GoogleFonts.plusJakartaSans(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<RateTripBloc, RateTripState>(
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    "How was your rental with Alex?",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 16),

                  Image.asset(
                    trip.car.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),

                  const SizedBox(height: 24),

                  // Question
                  Text(
                    "Overall, how would you rate your experience?",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Rating buttons
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: List.generate(5, (index) {
                      final rating = index + 1;
                      final isSelected = state.selectedRating == rating;

                      return ChoiceChip(
                        label: Text("$rating star${rating > 1 ? 's' : ''}"),
                        selected: isSelected,
                        onSelected: (_) {
                          context.read<RateTripBloc>().add(
                            SelectRating(rating),
                          );
                        },
                        selectedColor: Colors.blue.shade100,
                      );
                    }),
                  ),

                  const SizedBox(height: 24),

                  // Feedback box
                  TextField(
                    maxLines: 4,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      context.read<RateTripBloc>().add(UpdateFeedback(value));
                    },
                  ),
                  const SizedBox(height: 24),

                  // Submit button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: state.isSubmitting
                          ? null
                          : () {
                              context.read<RateTripBloc>().add(SubmitReview());
                            },
                      child: state.isSubmitting
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text(
                              "Submit",
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
