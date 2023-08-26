import 'package:bookbode/app/Core/utilities/constants/spacing.dart';
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
        height: 400,
        width: 200.0,
        padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: .85,
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
                    kVSpace4,
                    if (hotel.location != null)
                      Text(
                        hotel.location!,
                        style: const TextStyle(fontSize: 12.0),
                      ),
                    kVSpace16,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${hotel.price}/Night',
                          style: const TextStyle(fontSize: 12.0),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 213, 195, 29),
                          size: 15,
                        ),
                        Text(
                          'Rating: ${hotel.rating ?? 'N/A'}',
                          style: const TextStyle(fontSize: 12.0),
                        ),
                      ],
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
