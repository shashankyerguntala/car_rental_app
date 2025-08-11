import 'package:car_rental_app/model/car_model.dart';
import 'package:car_rental_app/model/trip_model.dart';
import 'package:car_rental_app/screens/trip/bloc/trip_bloc.dart';
import 'package:car_rental_app/screens/your_trip/your_trip.dart';

import 'package:car_rental_app/widgets/add_on_section.dart';
import 'package:car_rental_app/widgets/price_summary.dart';
import 'package:car_rental_app/widgets/textfield_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldHelperWidgets extends StatefulWidget {
  final Car car;
  const TextFieldHelperWidgets({super.key, required this.car});

  @override
  State<TextFieldHelperWidgets> createState() => _TextFieldHelperWidgets();
}

class _TextFieldHelperWidgets extends State<TextFieldHelperWidgets> {
  final pickupController = TextEditingController();
  final dropoffController = TextEditingController();
  final rentalStartController = TextEditingController();
  final rentalEndController = TextEditingController();

  DateTime? startDate;
  DateTime? endDate;

  Future<void> pickDate({required bool isStart}) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: (startDate ?? DateTime.now()),

      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        if (isStart) {
          startDate = pickedDate;
          rentalStartController.text =
              "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
        } else {
          endDate = pickedDate;
          rentalEndController.text =
              "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
        }
      });
    }
  }

  Widget confirmButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          final trip = Trip(
            pickup: pickupController.text,
            dropoff: dropoffController.text,
            rentalStart: startDate ?? DateTime.now(),
            rentalEnd: endDate ?? DateTime.now().add(const Duration(days: 1)),
            price: 200 + 25 + calculateAddOns().toDouble(),
          );

          context.read<TripBloc>().add(
            ConfirmTripClicked(trip: trip, car: widget.car),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF9ACD32),
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0,
        ),
        child: Text(
          "Confirm Trip",
          style: GoogleFonts.plusJakartaSans(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget formSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Trip Details',
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Text('Pickup Location', style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 8),
        TextfieldTrip(
          controller: pickupController,
          title: "Pickup Location",
          icon: Icons.location_on_outlined,
          isDataField: false,
        ),
        const SizedBox(height: 16),
        Text('Dropoff Location', style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 8),
        TextfieldTrip(
          controller: dropoffController,
          title: "Dropoff Location",
          icon: Icons.location_on_outlined,
          isDataField: false,
        ),
        const SizedBox(height: 16),
        Text('Rental Start', style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => pickDate(isStart: true),
          child: AbsorbPointer(
            child: TextfieldTrip(
              controller: rentalStartController,
              title: "Rental Start",
              icon: Icons.calendar_today_outlined,
              isDataField: true,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text('Rental End', style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => pickDate(isStart: false),
          child: AbsorbPointer(
            child: TextfieldTrip(
              controller: rentalEndController,
              title: "Rental End",
              icon: Icons.calendar_today_outlined,
              isDataField: true,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TripBloc, TripState>(
      listener: (context, state) {
        if (state is NavigateToYourTrip) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => YourTripPage(car: widget.car),
            ),
          );
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            formSection(),
            const SizedBox(height: 24),
            AddOnSection(),
            const SizedBox(height: 24),
            priceSummary(),
            const SizedBox(height: 32),
            confirmButton(context),
          ],
        );
      },
    );
  }
}
