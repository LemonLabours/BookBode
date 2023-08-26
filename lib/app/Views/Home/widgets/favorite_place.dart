import 'package:bookbode/app/Core/utilities/constants/colors.dart';
import 'package:flutter/material.dart';

class FavoritePlae extends StatelessWidget {
  const FavoritePlae({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Favorite place to holiday",
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
        ],
      ),
    );
  }
}
