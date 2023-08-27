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

    return ListView.builder(
      shrinkWrap:
          true, // To prevent unbounded height in the ListView inside Column
      physics:
          NeverScrollableScrollPhysics(), // To prevent independent scrolling inside the ListView
      itemCount: reviews!.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(reviews![index].userName ?? "Anonymous"),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow), // Star Icon
                      SizedBox(
                          width: 5), // Spacing between star icon and rating
                      Text('${reviews![index].userRating ?? 'N/A'}'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 5),
              Text(reviews![index].comment ?? "No comment"),
            ],
          ),
        );
      },
    );
  }
}
