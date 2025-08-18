import 'package:car_rental_app/constants.dart';
import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final String name;
  final String timeAgo;
  final int rating;
  final String review;
  final int likes;
  final int comments;
  final String avatar;

  const ReviewCard({
    super.key,
    required this.name,
    required this.timeAgo,
    required this.rating,
    required this.review,
    required this.likes,
    required this.comments,
    required this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(backgroundImage: AssetImage(avatar), radius: 20),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  timeAgo,
                  style: TextStyle(color: highlightColor, fontSize: 12),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 8),

        Row(
          children: [
            Icon(Icons.star_rounded),
            Icon(Icons.star_rounded),
            Icon(Icons.star_rounded),
            Icon(Icons.star_rounded),
            Icon(Icons.star_rounded),
          ],
        ),

        const SizedBox(height: 8),

        Text(review, style: const TextStyle(fontSize: 14)),

        const SizedBox(height: 12),

        Row(
          children: [
            Icon(Icons.thumb_up_outlined, color: highlightColor, size: 18),
            const SizedBox(width: 4),
            Text(likes.toString()),
            const SizedBox(width: 16),
            Icon(
              Icons.thumb_down_alt_outlined,
              color: highlightColor,
              size: 18,
            ),
            const SizedBox(width: 4),
            Text(comments.toString()),
          ],
        ),
      ],
    );
  }
}
