import 'package:flutter/material.dart';

class HotelName extends StatelessWidget {
  final String name;

  const HotelName({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(name,
        style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold));
  }
}

class HotelLocation extends StatelessWidget {
  final String? location;

  const HotelLocation({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Text(
      location ?? "Unknown location",
      style: TextStyle(
        fontSize: 16.0,
        color: Colors.grey[700],
      ),
    );
  }
}
