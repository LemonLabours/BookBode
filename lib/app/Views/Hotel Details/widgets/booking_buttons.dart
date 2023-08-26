import 'package:bookbode/app/Core/utilities/constants/colors.dart';
import 'package:bookbode/app/Core/utilities/constants/spacing.dart';
import 'package:bookbode/app/Core/utilities/shared/fill_buttons.dart';
import 'package:bookbode/app/Models/hotel_model.dart';
import 'package:flutter/material.dart';

import '../../Booking/booking_view.dart';

class BookingButtons extends StatelessWidget {
  final Hotel hotel;
  const BookingButtons({Key? key, required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: hWhiteColor,
      //elevation: 30,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const Text(
                "Start from",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              kVSpace4,
              Row(
                children: [
                  Text(
                    '\$${hotel.price}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    '/night',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: hDarkGray,
                    ),
                  ),
                ],
              ),
            ],
          ),
          FillButtons(
            width: 280,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BookingView()),
              );
            },
            text: 'Book room',
          ),
          
        ],
      ),
    );
  }
}
