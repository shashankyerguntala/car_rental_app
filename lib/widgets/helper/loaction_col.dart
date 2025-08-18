import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget locationColumn(String label, String? location) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: GoogleFonts.plusJakartaSans(
          fontSize: 14,
          color: Colors.grey[600],
        ),
      ),
      const SizedBox(height: 4),
      Text(
        location ?? "Not selected",
        style: GoogleFonts.plusJakartaSans(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    ],
  );
}
