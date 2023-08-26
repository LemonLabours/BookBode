import 'package:bookbode/app/Core/utilities/constants/colors.dart';
import 'package:bookbode/app/Core/utilities/constants/spacing.dart';
import 'package:flutter/widgets.dart';

class CitiesList extends StatefulWidget {
  const CitiesList({super.key});

  @override
  State<CitiesList> createState() => _CitiesListState();
}

class _CitiesListState extends State<CitiesList> {
  var citiesList = {
    "2.png": "Paris",
    "3.png": "London",
    "4.png": "Bangkok",
    "5.png": "Roma",
    "6.png": "Jakarta",
  };

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: double.maxFinite,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: citiesList.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(right: 24),
              child: Column(children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: hMnueColor,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      "assets/imgs/${citiesList.keys.elementAt(index)}",
                      fit: BoxFit.cover,
                      height: 80, // match the container's height
                      width: 80, // match the container's width
                    ),
                  ),
                ),
                kVSpace8,
                Text(
                  citiesList.values.elementAt(index),
                  style: const TextStyle(color: hDarkGray, fontSize: 14),
                ),
              ]),
            );
          }),
    );
  }
}
