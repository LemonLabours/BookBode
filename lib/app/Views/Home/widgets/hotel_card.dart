import 'package:flutter/material.dart';
import '../../../Models/hotel_model.dart';
import '../../Hotel Details/hotel_detail_view.dart';

class HotelCard extends StatelessWidget {
  final Hotel hotel;

  const HotelCard({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HotelDetailsView(
                    hotel: hotel,
                  )),
        );
      },
      child: Container(
        width: 200.0,
        margin: const EdgeInsets.symmetric(horizontal: 3.0),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: .65,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  child: Image.network(
                    hotel.hotelImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hotel.name,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    if (hotel.location != null)
                      Text(
                        hotel.location!,
                        style: const TextStyle(fontSize: 10.0),
                      ),
                    const SizedBox(height: 5.0),
                    Text(
                      'Rating: ${hotel.rating ?? 'N/A'}',
                      style: const TextStyle(fontSize: 10.0),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      '\$${hotel.price}/Night',
                      style: const TextStyle(fontSize: 10.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
