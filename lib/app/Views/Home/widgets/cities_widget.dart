import 'package:bookbode/app/Core/utilities/constants/colors.dart';
import 'package:bookbode/app/Views/Home/widgets/cities_list.dart';
import 'package:flutter/material.dart';

class CitiesWidget extends StatefulWidget {
  const CitiesWidget({super.key});

  @override
  State<CitiesWidget> createState() => _CitiesWidgetState();
}

class _CitiesWidgetState extends State<CitiesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 24, left: 24, top: 0),
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
          const CitiesList(),
        ],
      ),
    );
  }
}
