import 'package:car_rental_app/helper/helper_widgets.dart';
import 'package:car_rental_app/model/car_model.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class TripDetailsPage extends StatefulWidget {
  final Car car;

  const TripDetailsPage({super.key, required this.car});

  @override
  State<TripDetailsPage> createState() => _TripDetailsPageState();
}

class _TripDetailsPageState extends State<TripDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Trip Details Form",
          style: GoogleFonts.plusJakartaSans(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: TextFieldHelperWidgets(car: widget.car),
      ),
    );
  }
}
