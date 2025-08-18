import 'package:car_rental_app/widgets/review_card.dart';
import 'package:flutter/material.dart';

class LastMinuteDealsSection extends StatelessWidget {
  const LastMinuteDealsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Last-Minute Deals',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Weekend getaway',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Save 20% on rentals of 3+ days',
                      style: TextStyle(color: Colors.green, fontSize: 14),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset('assets/last_deals.png', fit: BoxFit.cover),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        Text(
          'Customer Reviews',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        const SizedBox(height: 12),

        const ReviewCard(
          name: 'Sophia',
          timeAgo: '1 month ago',
          rating: 5,
          review:
              'Great experience! The car was clean and the service was excellent.',
          likes: 12,
          comments: 2,
          avatar: 'assets/profile1.png',
        ),
        const SizedBox(height: 12),
        const ReviewCard(
          name: 'Ethan',
          timeAgo: '2 months ago',
          rating: 4,
          review: 'Good value for money. The car was reliable.',
          likes: 8,
          comments: 1,
          avatar: 'assets/profile2.png',
        ),
      ],
    );
  }
}
