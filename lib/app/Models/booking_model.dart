import 'dart:core';

class Booking {
  final String bookingId;
  final DateTime createdAt;
  final String? hotelId;
  final String? checkInDate;
  final double? totalPrice;
  final String? customerId;

  Booking({
    required this.bookingId,
    required this.createdAt,
    this.hotelId,
    this.checkInDate,
    this.totalPrice,
    this.customerId,
  });

  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      bookingId: map['booking_id'],
      createdAt: DateTime.parse(map['created_at']),
      hotelId: map['hotel_id'],
      checkInDate: map['check_in'],
      totalPrice: map['total_price'],
      customerId: map['customers_id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'booking_id': bookingId,
      'created_at': createdAt.toIso8601String(),
      'hotel_id': hotelId,
      'check_in': checkInDate,
      'total_price': totalPrice,
      'customers_id': customerId,
    };
  }
}
