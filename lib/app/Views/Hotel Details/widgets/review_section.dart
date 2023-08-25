import 'package:flutter/material.dart';

import '../../../Models/review_model.dart';

class ReviewSection extends StatelessWidget {
  final List<Review>? reviews;
  final bool isLoading;

  const ReviewSection({super.key, required this.reviews, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (reviews == null || reviews!.isEmpty) {
      return const Text("No reviews available.");
    }

    return Column(
      children: reviews!
          .map((review) => ListTile(
                title: Text(review.comment ?? "No comment"),
                subtitle: Text("Rating: ${review.userRating ?? 'N/A'}"),
              ))
          .toList(),
    );
  }
}

