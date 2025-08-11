import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddOnSection extends StatefulWidget {
  const AddOnSection({super.key});

  @override
  State<AddOnSection> createState() => _AddOnSectionState();
}

Widget addOnRow({
  required String title,
  required String subtitle,
  required IconData icon,
  required bool isSelected,
  required Function(bool?) onChanged,
}) {
  return Row(
    children: [
      Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(icon, color: Colors.grey[700], size: 20),
      ),
      const SizedBox(width: 16),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
      Transform.scale(
        scale: 1.1,
        child: Checkbox(
          value: isSelected,
          onChanged: onChanged,
          activeColor: Colors.black,
          checkColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
      ),
    ],
  );
}

class _AddOnSectionState extends State<AddOnSection> {
  bool insuranceSelected = false;
  bool gpsSelected = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Optional Add-ons', style: const TextStyle(fontSize: 22)),
        const SizedBox(height: 16),
        addOnRow(
          title: "Insurance",
          subtitle: "\$15/day",
          icon: Icons.shield_outlined,
          isSelected: insuranceSelected,
          onChanged: (value) =>
              setState(() => insuranceSelected = value ?? false),
        ),
        const SizedBox(height: 16),
        addOnRow(
          title: "GPS",
          subtitle: "\$10/day",
          icon: Icons.gps_fixed,
          isSelected: gpsSelected,
          onChanged: (value) => setState(() => gpsSelected = value ?? false),
        ),
      ],
    );
  }
}
