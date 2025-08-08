import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../model/car_model.dart';

class DetailsPage extends StatelessWidget {
  final Car car;

  const DetailsPage({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: Image(
                    image: AssetImage(car.imageUrl2),
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 12,
                  left: 12,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.favorite_border),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),

            Expanded(
              child: SingleChildScrollView(
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
                    const SizedBox(height: 12),

                    Row(
                      children: [
                        _buildLabelValue("Make", car.make),
                        const Spacer(),
                        _buildLabelValue("Model", car.model),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        _buildLabelValue("Year", car.year),
                        const Spacer(),
                        _buildLabelValue("Type", car.type),
                      ],
                    ),

                    const SizedBox(height: 24),

                    Text(
                      "Features",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildFeature("Automatic Transmission"),
                    _buildFeature("Leather Seats"),
                    _buildFeature("Navigation System"),
                    _buildFeature("Premium Sound System"),

                    const SizedBox(height: 24),

                    Text(
                      "Rental Terms",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      car.rentalTerms,
                      style: GoogleFonts.plusJakartaSans(fontSize: 14),
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
                        _buildLabelValue("Daily Rate", "\$${car.dailyRate}"),
                        const Spacer(),
                        _buildLabelValue(
                          "Total (3 days)",
                          "\$${car.dailyRate * 3}",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFCCFF00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
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
    );
  }

  Widget _buildLabelValue(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.plusJakartaSans(fontSize: 12, color: Colors.grey),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: GoogleFonts.plusJakartaSans(fontSize: 14, color: Colors.green),
        ),
      ],
    );
  }

  Widget _buildFeature(String feature) {
    return Row(
      children: [
        Checkbox(value: false, onChanged: (_) {}),
        Text(feature, style: GoogleFonts.plusJakartaSans(fontSize: 14)),
      ],
    );
  }
}
