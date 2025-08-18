import 'package:car_rental_app/bloc/trip_bloc/trip_bloc.dart';
import 'package:car_rental_app/features/Trip/trip_details/widgets/custom_text_field.dart';
import 'package:car_rental_app/features/Trip/trip_details/widgets/end_date_picker.dart';
import 'package:car_rental_app/features/Trip/trip_details/widgets/start_date_picker.dart';
import 'package:car_rental_app/features/Trip/your_trip/your_trip.dart';

import 'package:car_rental_app/model/car_model.dart';
import 'package:car_rental_app/model/trip_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TripDetailsPage extends StatefulWidget {
  final Car car;

  const TripDetailsPage({super.key, required this.car});

  @override
  State<TripDetailsPage> createState() => _TripDetailsPageState();
}

class _TripDetailsPageState extends State<TripDetailsPage> {
  final TextEditingController pickupController = TextEditingController();
  final TextEditingController dropoffController = TextEditingController();

  bool insuranceSelected = false;
  bool gpsSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(Icons.question_mark_sharp),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Trip Details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
              child: const Text(
                "Pickup Location",
                style: TextStyle(fontSize: 16),
              ),
            ),

            customTextField(pickupController, Icons.location_on),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
              child: const Text(
                "Dropoff Location",
                style: TextStyle(fontSize: 16),
              ),
            ),
            customTextField(dropoffController, Icons.location_on),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
              child: const Text("Rental Start", style: TextStyle(fontSize: 16)),
            ),
            StartDatePicker(),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
              child: const Text("Rental End", style: TextStyle(fontSize: 16)),
            ),

            EndDatePicker(),

            const SizedBox(height: 24),

            const Text(
              "Optional Add-ons",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            SwitchListTile(
              value: insuranceSelected,
              onChanged: (val) => setState(() => insuranceSelected = val),
              title: const Text("Insurance"),
              subtitle: const Text("\$15/day"),
            ),
            SwitchListTile(
              value: gpsSelected,
              onChanged: (val) => setState(() => gpsSelected = val),
              title: const Text("GPS"),
              subtitle: const Text("\$10/day"),
            ),

            const SizedBox(height: 24),

            const Text(
              "Price Summary",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            priceRow("Base Rental", "\$200"),
            priceRow("Taxes & Fees", "\$25"),
            priceRow("Optional Add-ons", "\$25"),
            const Divider(),
            priceRow("Total", "\$250", isBold: true),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: BlocConsumer<TripBloc, TripState>(
                listener: (context, state) {
                  if (state is NavigateToYourTripPage) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => YourTripScreen(trip: state.trip),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      final tripState = context.read<TripBloc>().state;

                      DateTime startDate = DateTime.now();
                      DateTime endDate = DateTime.now();

                      if (tripState is TripDatesSelected) {
                        if (tripState.startDate != null) {
                          startDate = tripState.startDate!;
                        }
                        if (tripState.endDate != null) {
                          endDate = tripState.endDate!;
                        }
                      }
                      final trip = Trip(
                        pickupLocation: pickupController.text,
                        dropoffLocation: dropoffController.text,
                        rentalStart: startDate,
                        rentalEnd: endDate,
                        insurance: insuranceSelected,
                        gps: gpsSelected,
                        totalPrice: 1,
                        car: widget.car,
                      );
                      context.read<TripBloc>().add(
                        ClickedConfirmTrip(trip: trip),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffC1FC4A),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Confirm Trip",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget priceRow(String label, String price, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            price,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
