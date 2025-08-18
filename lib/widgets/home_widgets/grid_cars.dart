import 'package:car_rental_app/features/details_page/details_page.dart';
import 'package:car_rental_app/model/car_model.dart';
import 'package:car_rental_app/widgets/home_widgets/popular_locations_card.dart';

import 'package:flutter/material.dart';

class RentalCategoryGrid extends StatelessWidget {
  const RentalCategoryGrid({super.key, required this.cars});

  final List<Car> cars;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.9,
        crossAxisSpacing: 16,
      ),
      itemCount: cars.length,
      itemBuilder: (context, index) {
        final car = cars[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AboutThis(car: cars[index]),
              ),
            );
          },
          child: PopularLocationsCard(
            imageUrl: car.imageUrl,
            cityName: car.type,
            rate: car.make,
          ),
        );
      },
    );
  }
}
