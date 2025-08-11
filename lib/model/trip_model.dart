class Trip {
  final String pickup;
  final String dropoff;
  final DateTime rentalStart;
  final DateTime rentalEnd;
  final double price;

  Trip({
    required this.pickup,
    required this.dropoff,
    required this.rentalStart,
    required this.rentalEnd,
    required this.price,
  });
}
