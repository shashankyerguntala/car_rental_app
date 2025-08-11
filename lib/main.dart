import 'package:car_rental_app/screens/home/bloc/home_bloc.dart';
import 'package:car_rental_app/screens/home/home_page.dart';
import 'package:car_rental_app/screens/trip/bloc/trip_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) {
            final bloc = HomeBloc();
            bloc.add(LoadCars());
            return bloc;
          },
        ),
        BlocProvider<TripBloc>(create: (_) => TripBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Car Rental App',
        theme: ThemeData(textTheme: GoogleFonts.plusJakartaSansTextTheme()),
        home: const HomePage(),
      ),
    );
  }
}
