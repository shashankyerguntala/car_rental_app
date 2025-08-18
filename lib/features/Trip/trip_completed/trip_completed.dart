import 'package:car_rental_app/features/Trip/rate_your_trip/rate_your_trip_Screen.dart';
import 'package:car_rental_app/model/trip_model.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class TripCompletedScreen extends StatelessWidget {
  final Trip trip;

  const TripCompletedScreen({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Trip completed",
          style: GoogleFonts.plusJakartaSans(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),

          Image.asset(
            trip.car.imageUrl,
            width: double.infinity,
            height: 250,
            fit: BoxFit.cover,
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Thank you for your trip!",
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "We hope you enjoyed your ride. Here are some options for next steps:",
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1),

          optionTile("View trip details", onTap: () {}),
          optionTile("Contact support", onTap: () {}),
          optionTile(
            "Leave a review",
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => RateYourTripScreen(trip: trip),
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: "Trips"),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  Widget optionTile(String text, {VoidCallback? onTap}) {
    return ListTile(
      title: Text(
        text,
        style: GoogleFonts.plusJakartaSans(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
