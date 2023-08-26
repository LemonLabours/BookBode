
import 'package:flutter/material.dart';

import '../../../Models/hotel_model.dart';

class Facilities extends StatelessWidget {
  final List<Facility>? facilities;

  const Facilities({super.key, required this.facilities});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Facilities', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10.0),
        if (facilities != null && facilities!.isNotEmpty)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: facilities!
                  .map((facility) => Chip(
                        label: Text(facility.facility),
                        avatar: CircleAvatar(child: Text(facility.icon)),
                        elevation: 2.0,
                      ))
                  .toList(),
            ),
          )
        else
          const Text("No facilities available.")
      ],
    );
  }
}
