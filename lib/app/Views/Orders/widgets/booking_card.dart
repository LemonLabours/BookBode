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
        elevation: 2,
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
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(hotel.hotelImage),
                  backgroundColor: Colors.transparent,
                  radius: 30,
                ),
                title: Text('Hotel: ${hotel.name}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Booking ID: ${booking.bookingId}'),
                    Text('Check-In: ${booking.checkInDate}'),
                    Text('Booked On: ${booking.createdAt.toString()}'),
                    Text('Total: \$${booking.totalPrice.toString()}'),
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
