import 'package:car_rental_app/constants.dart';

import 'package:car_rental_app/screens/details_page/details_page.dart';

import 'package:car_rental_app/screens/home/bloc/home_bloc.dart';
import 'package:car_rental_app/widgets/car_cards.dart';

import 'package:car_rental_app/widgets/popular_locations_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        centerTitle: true,
        title: Text(
          'Rentals',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(Icons.settings, size: 24),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                child: SearchBar(
                  hintStyle: WidgetStateProperty.all<TextStyle>(
                    TextStyle(color: highlightColor, fontSize: 16),
                  ),
                  hintText: 'Where to?',
                  leading: Icon(Icons.search, color: highlightColor, size: 24),
                  elevation: WidgetStateProperty.all(0),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  backgroundColor: WidgetStateProperty.all<Color>(
                    const Color(0xFFF0F5F0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 16, 12),
                child: Text(
                  'Popular Locations',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    PopularLocationsCarousel(
                      imageUrl: 'assets/locations/newyork.png',
                      cityName: 'New York',
                      rate: 50,
                    ),
                    const SizedBox(width: 12),
                    PopularLocationsCarousel(
                      imageUrl: 'assets/locations/miami.png',
                      cityName: 'Miami',
                      rate: 45,
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 16, 12),
                child: Text(
                  'Rental Categories',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
              BlocConsumer<HomeBloc, HomeState>(
                listener: (context, state) {
                  if (state is NavigateToDetails) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(car: state.car),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is CarsLoaded) {
                    final cars = state.car;

                    return GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: cars.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 0.8,
                          ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            context.read<HomeBloc>().add(
                              ClickedCar(car: cars[index]),
                            );
                          },
                          child: CarCards(car: cars[index]),
                        );
                      },
                    );
                  }
                  return Center(child: Text('doomed'));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
