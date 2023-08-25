import 'package:flutter/material.dart';

import '../../Booking/booking_view.dart';
import '../../Review/review_view.dart';

class BookingButtons extends StatelessWidget {
  const BookingButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BookingView()),
            );
          },
          child: const Text('Book'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ReviewView()),
            );
          },
          child: const Text('Add Review'),
        ),
      ],
    );
  }
}
