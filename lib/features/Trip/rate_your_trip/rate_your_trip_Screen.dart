import 'package:car_rental_app/model/trip_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RateYourTripScreen extends StatelessWidget {
  final Trip trip;

  const RateYourTripScreen({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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

            Text(
              "Overall, how would you rate your experience?",
              style: GoogleFonts.plusJakartaSans(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),

            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: List.generate(5, (index) {
                final rating = index + 1;
                return Chip(
                  label: Text("$rating star${rating > 1 ? 's' : ''}"),
                  backgroundColor: Colors.grey.shade200,
                );
              }),
            ),

            const SizedBox(height: 24),

            const TextField(
              maxLines: 4,
              enabled: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Write your feedback here...",
              ),
            ),
            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
                onPressed: null,
                child: Text(
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
      ),
    );
  }
}
