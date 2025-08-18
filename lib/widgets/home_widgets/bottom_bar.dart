import 'package:car_rental_app/features/Trip/upcoming_trips/upcoming_trips.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.home, color: Colors.black),
              Text("Home", style: TextStyle(color: Colors.black)),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UpcomingTrips()),
                ),
                child: Icon(Icons.car_rental, color: Colors.black),
              ),
              Text("Trips", style: TextStyle(color: Colors.black)),
            ],
          ),

          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.person_outline_rounded, color: Colors.black),
              Text("Profile", style: TextStyle(color: Colors.black)),
            ],
          ),
        ],
      ),
    );
  }
}
