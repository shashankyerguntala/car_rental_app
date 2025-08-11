import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget priceSummaryRow(String title, String price) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 16,
            color: Colors.grey[700],
          ),
        ),
        Text(
          price,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ],
    ),
  );
}

bool insuranceSelected = false;
bool gpsSelected = false;

Widget priceSummary() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Price Summary'),
      const SizedBox(height: 16),
      priceSummaryRow("Base Rental", "\$200"),
      priceSummaryRow("Taxes & Fees", "\$25"),
      priceSummaryRow("Optional Add-ons", "\$${calculateAddOns()}"),
    ],
  );
}

int calculateAddOns() {
  int total = 0;
  if (insuranceSelected) total += 15;
  if (gpsSelected) total += 10;
  return total;
}
