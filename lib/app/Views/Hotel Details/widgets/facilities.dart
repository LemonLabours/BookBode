import 'package:bookbode/app/Core/utilities/constants/spacing.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../Models/hotel_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Facilities extends StatelessWidget {
  final List<Facility>? facilities;

  const Facilities({Key? key, required this.facilities}) : super(key: key);

  IconData getIcon(String iconName) {
    if (kDebugMode) {
      print("Icon Name: $iconName");
    }
    switch (iconName) {
      case 'wifi':
        return FontAwesomeIcons.wifi;
      case 'parking':
        return FontAwesomeIcons.squareParking;
      case 'pool':
        return FontAwesomeIcons.personSwimming;
      case 'wineBottle':
        return FontAwesomeIcons.wineBottle;
      case 'breadSlice':
        return FontAwesomeIcons.breadSlice;
      case 'bus':
        return FontAwesomeIcons.bus;
      case 'coffee':
        return FontAwesomeIcons.mugHot;
      case 'theaterMasks':
        return FontAwesomeIcons.mask;
      case 'tree':
        return FontAwesomeIcons.tree;
      case 'landmark':
        return FontAwesomeIcons.landmark;
      case 'wineGlassAlt':
        return FontAwesomeIcons.wineGlass;
      case 'scooter':
        return FontAwesomeIcons.motorcycle;
      case 'pizzaSlice':
        return FontAwesomeIcons.pizzaSlice;
      case 'placeOfWorship':
        return FontAwesomeIcons.placeOfWorship;
      case 'shoppingBasket':
        return FontAwesomeIcons.basketShopping;
      case 'spa':
        return FontAwesomeIcons.spa;
      case 'taxi':
        return FontAwesomeIcons.taxi;
      case 'music':
        return FontAwesomeIcons.music;
      case 'umbrellaBeach':
        return FontAwesomeIcons.umbrellaBeach;
      case 'utensils':
        return FontAwesomeIcons.utensils;
      case 'palette':
        return FontAwesomeIcons.palette;
      case 'monument':
        return FontAwesomeIcons.monument;
      default:
        return FontAwesomeIcons.question;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Facilities',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
        ResponsiveSpacing.height(context, large),
        if (facilities != null && facilities!.isNotEmpty)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: facilities!
                  .map((facility) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          children: [
                            Icon(getIcon(facility.icon), size: 24.0),
                            const SizedBox(height: 5.0),
                            Text(facility.facility),
                          ],
                        ),
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
