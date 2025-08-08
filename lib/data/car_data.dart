import 'package:car_rental_app/model/car_model.dart';

final List<Car> cars = [
  Car(
    model: 'Model S',
    make: 'Tesla',
    imageUrl: 'assets/cars/luxury.png',
    year: '2023',
    dailyRate: 250,
    type: 'Luxury',
    desc: 'Arrive in style',
    rentalTerms:
        'Minimum rental 2 days. Unlimited mileage. Full insurance included.',
    imageUrl2: 'assets/cars/luxury2.png',
  ),
  Car(
    model: 'Urus',
    make: 'Ford',
    imageUrl: 'assets/cars/suv.png',
    year: '2022',
    dailyRate: 180,
    type: 'SUV',
    desc: 'Adventure awaits',
    rentalTerms:
        'Minimum rental 1 day. 300km/day limit. Additional km ₹15 each.',
    imageUrl2: 'assets/cars/suv.png',
  ),
  Car(
    model: 'Electric',
    make: 'Honda',
    imageUrl: 'assets/cars/electric.png',
    year: '2021',
    dailyRate: 120,
    desc: 'Eco-friendly rides',
    type: 'Electric',
    rentalTerms: 'Minimum rental 1 day. 200km/day limit. Insurance optional.',
    imageUrl2: 'assets/cars/electric.png',
  ),
];
