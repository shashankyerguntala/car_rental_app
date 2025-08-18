import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget extraRow(String title, String subtitle, String actionText) {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    leading: const Icon(Icons.shield),
    title: Text(
      title,
      style: GoogleFonts.plusJakartaSans(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    subtitle: Text(
      subtitle,
      style: GoogleFonts.plusJakartaSans(color: Colors.grey[600]),
    ),
    trailing: Text(
      actionText,
      style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w600),
    ),
  );
}
