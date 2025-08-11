import 'package:car_rental_app/screens/trip/ui/trip_details.dart';
import 'package:car_rental_app/widgets/label.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../model/car_model.dart';

class DetailsPage extends StatelessWidget {
  final Car car;

  const DetailsPage({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Image(
                  image: AssetImage(car.imageUrl2),
                  fit: BoxFit.cover,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About this car",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Divider(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          Label(title: 'Make', value: car.make),

                          Padding(
                            padding: const EdgeInsets.only(left: 24),
                            child: Label(title: 'Model', value: car.model),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Divider(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Label(value: car.year, title: 'Year'),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 42.0),
                      child: Text(
                        "Features",
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    feature("Automatic Transmission"),
                    feature("Leather Seats"),
                    feature("Navigation System"),
                    feature("Premium Sound System"),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 16, 0, 8),
                      child: Text(
                        "Rental Terms",
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      car.rentalTerms,
                      style: GoogleFonts.plusJakartaSans(fontSize: 16),
                    ),

                    const SizedBox(height: 24),

                    Text(
                      "Pricing",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Label(
                            title: "Daily Rate",
                            value: "\$${car.dailyRate}",
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 24.0),
                          child: Label(
                            title: 'Total (3 days)',
                            value: '\$${car.dailyRate * 3}',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color(0xFFCCFF00),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TripDetailsPage(car: car),
                        ),
                      );
                    },
                    child: Text(
                      "Book Now",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget feature(String feature) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 12, 12, 6),
          child: Icon(Icons.check_box_outline_blank_outlined),
        ),
        Text(feature, style: GoogleFonts.plusJakartaSans(fontSize: 16)),
      ],
    );
  }
}
