import 'package:bookbode/app/Core/utilities/constants/colors.dart';
import 'package:flutter/material.dart';

class CitiesWidget extends StatelessWidget {
  const CitiesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Populer cities",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "See all",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: primary),
                ),
              ),
            ],
          ),

          //   GridView(gridDelegate)
        ],
      ),
    );
  }
}
