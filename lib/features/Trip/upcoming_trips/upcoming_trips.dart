import 'package:car_rental_app/bloc/trip_bloc/trip_bloc.dart';
import 'package:car_rental_app/features/Trip/trip_completed/trip_completed.dart';
import 'package:car_rental_app/model/trip_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';

class UpcomingTrips extends StatefulWidget {
  const UpcomingTrips({super.key});

  @override
  State<UpcomingTrips> createState() => _UpcomingTripsState();
}

class _UpcomingTripsState extends State<UpcomingTrips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trips"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: BlocConsumer<TripBloc, TripState>(
        listener: (context, state) {},
        builder: (context, state) {
          final trips = context.read<TripBloc>().trips;

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: trips.length,
            itemBuilder: (context, index) {
              final trip = trips[index];
              return tripCard(trip);
            },
          );
        },
      ),
    );
  }

  Widget tripCard(Trip trip) {
    String dateRange =
        "${DateFormat.MMMd().format(trip.rentalStart)} - ${DateFormat.MMMd().format(trip.rentalEnd)}";

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TripCompletedScreen(trip: trip),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          contentPadding: const EdgeInsets.all(12),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image(image: AssetImage(trip.car.imageUrl)),
          ),
          title: Text(
            trip.car.make,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text("$dateRange • ${trip.dropoffLocation}"),
        ),
      ),
    );
  }
}
