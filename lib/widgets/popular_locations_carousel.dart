import 'package:car_rental_app/constants.dart';

import 'package:flutter/material.dart';

class PopularLocationsCarousel extends StatelessWidget {
  final String imageUrl;
  final String cityName;
  final int rate;

  const PopularLocationsCarousel({
    super.key,
    required this.imageUrl,
    required this.cityName,
    required this.rate,
  });

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
              imageUrl,
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
                  cityName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              Text(
                'From \$$rate/day',
                style: TextStyle(color: highlightColor, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
