import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextfieldTrip extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final IconData icon;
  final bool isDataField;
  final ValueChanged<String>? onChanged;
  const TextfieldTrip({
    super.key,
    required this.controller,
    required this.title,
    required this.icon,
    required this.isDataField,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF0F5F0),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
      child: TextField(
        controller: controller,
        readOnly: isDataField,
        onChanged: onChanged,
        style: GoogleFonts.plusJakartaSans(fontSize: 16, color: Colors.black87),
        decoration: InputDecoration(
          labelText: title,
          labelStyle: GoogleFonts.plusJakartaSans(
            fontSize: 14,
            color: Colors.grey[600],
          ),
          suffixIcon: Icon(icon, color: Colors.grey[600], size: 20),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
      ),
    );
  }
}
