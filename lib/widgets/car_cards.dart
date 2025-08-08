import 'package:car_rental_app/constants.dart';
import 'package:car_rental_app/model/car_model.dart';

import 'package:flutter/material.dart';

class CarCards extends StatelessWidget {
  final Car car;

  const CarCards({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(8),
            child: Image.asset(
              car.imageUrl,
              height: 135,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: Text(
                  car.type,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              Text(
                car.desc,
                style: TextStyle(color: highlightColor, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
