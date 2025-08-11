import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Label extends StatelessWidget {
  final String title;
  final String value;
  const Label({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.plusJakartaSans(fontSize: 16, color: Colors.grey),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: GoogleFonts.plusJakartaSans(fontSize: 14, color: Colors.green),
        ),
      ],
    );
  }
}
