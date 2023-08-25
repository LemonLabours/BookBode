import 'package:flutter/material.dart';

import '../../../Models/review_model.dart';

class RatingAndReviews extends StatelessWidget {
  final double? hotelRating;
  final List<Review>? reviews;

  const RatingAndReviews({super.key, required this.hotelRating, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.yellow),
        const SizedBox(width: 5),
        Text('${hotelRating ?? 'N/A'}', style: const TextStyle(fontSize: 14.0)),
        const SizedBox(width: 10),
        Text('${reviews?.length ?? 0} Reviews', style: const TextStyle(fontSize: 12.0)),
      ],
    );
  }
}

