import 'package:bookbode/app/Core/utilities/constants/spacing.dart';
import 'package:flutter/material.dart';

import '../../../Models/review_model.dart';

class ReviewSection extends StatelessWidget {
  final List<Review>? reviews;
  final bool isLoading;

  const ReviewSection({
    super.key,
    required this.reviews,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (reviews == null || reviews!.isEmpty) {
      return const Text("No reviews available.");
    }

    return Column(
      children: [
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Reviews',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ResponsiveSpacing.height(context, medium),
        Column(
          children: reviews!
              .map((review) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              review.userName ?? "Anonymous",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.yellow),
                                const SizedBox(width: 5),
                                Text('${review.userRating ?? 'N/A'}'),
                              ],
                            ),
                          ],
                        ),
                        Text(review.comment ?? "No comment"),
                      ],
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
