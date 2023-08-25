import 'package:flutter/material.dart';

import '../../../Models/hotel_model.dart';
import 'hotel_card.dart';

class HotelListView extends StatelessWidget {
  final List<Hotel> hotels;

  const HotelListView({super.key, required this.hotels});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      itemCount: hotels.length,
      itemBuilder: (context, index) {
        return HotelCard(hotel: hotels[index]);
      },
    );
  }
}
