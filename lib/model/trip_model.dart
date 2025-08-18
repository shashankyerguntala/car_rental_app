import 'package:car_rental_app/model/car_model.dart';

class Trip {
  final String pickupLocation;
  final String dropoffLocation;
  final DateTime rentalStart;
  final DateTime rentalEnd;
  final bool insurance;
  final bool gps;
  final double totalPrice;

  final Car car;

  Trip({
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.rentalStart,
    required this.rentalEnd,
    this.insurance = false,
    this.gps = false,
    required this.totalPrice,

    required this.car,
  });
}
