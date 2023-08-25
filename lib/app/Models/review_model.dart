import 'dart:core';

class Review {
  final String reviewId;
  final DateTime createdAt;
  final double? userRating;
  final String? comment;
  final String? hotelId;
  final String userId;

  Review({
    required this.reviewId,
    required this.createdAt,
    this.userRating,
    this.comment,
    this.hotelId,
    required this.userId,
  });

  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      reviewId: map['review_id'],
      createdAt: DateTime.parse(map['created_at']),
      userRating: map['user_rating'],
      comment: map['comment'],
      hotelId: map['hotel_id'],
      userId: map['user_id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'review_id': reviewId,
      'created_at': createdAt.toIso8601String(),
      'user_rating': userRating,
      'comment': comment,
      'hotel_id': hotelId,
      'user_id': userId,
    };
  }
}
