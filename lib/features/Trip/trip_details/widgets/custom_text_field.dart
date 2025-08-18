import 'package:flutter/material.dart';

Widget customTextField(TextEditingController controller, IconData icon) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Color(0xffF0F5F0),
    ),

    child: TextField(
      maxLines: null,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      controller: controller,
    ),
  );
}
