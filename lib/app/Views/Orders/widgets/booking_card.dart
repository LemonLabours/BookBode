import 'package:bookbode/app/Core/utilities/constants/spacing.dart';
import 'package:flutter/material.dart';
import '../../../Core/services/Database/database.dart';
import '../../../Models/booking_model.dart';
import '../../../Models/hotel_model.dart';

class BookingCard extends StatelessWidget {
  final Booking booking;

  const BookingCard({Key? key, required this.booking}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final databaseService = DatabaseService();

    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 0, // Remove elevation
        child: FutureBuilder<Hotel>(
          future: databaseService.getHotelById(booking.hotelId!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData) {
              return const Center(child: Text('No hotel found.'));
            } else {
              final hotel = snapshot.data!;
              return SizedBox(
                height: 360, // same height as the image
                child: Row(
                  children: [
                    Container(
                      width: 200,
                      height: 360,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(hotel.hotelImage),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ResponsiveSpacing.height(context, small),
                          Text('Hotel: ${hotel.name}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          ResponsiveSpacing.height(context, small),
                          Text('Check-In: ${booking.checkInDate}'),
                          ResponsiveSpacing.height(context, small),
                          Text('Total: \$${booking.totalPrice.toString()}'),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
