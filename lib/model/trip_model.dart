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

  double get addOns {
    double addons = 0;
    if (insurance) addons += 15;
    if (gps) addons += 10;

    final days = rentalEnd.difference(rentalStart).inDays;
    return addons * (days > 0 ? days : 1);
  }
}
