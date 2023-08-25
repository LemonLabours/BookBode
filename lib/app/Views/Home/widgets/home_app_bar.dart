import 'package:bookbode/app/Core/utilities/constants/colors.dart';
import 'package:bookbode/app/Core/utilities/constants/spacing.dart';
import 'package:bookbode/app/Core/utilities/shared/fill_buttons.dart';
import 'package:bookbode/app/Core/utilities/shared/text_fields_widgets.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [primary, secondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          kVSpace16,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Stack(
              children: [
                Row(
                  children: [
                    const Text(
                      'Hello!',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: hWhiteColor),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 210,
                      width: 210,
                      child: Image.asset(
                        "assets/imgs/1.png",
                        fit: BoxFit.fill,
                      ),
                    )
                  ],
                ),
                kVSpace8,
                const Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Stack(
                    children: [
                      TextFieldWidget(
                        borderRadius: 50,
                        prefixIcon: Icons.search,
                        hintText: "Where do you want to stay?",
                      ),
                      // kVSpace4,,.
                      Positioned(
                        top: 36,
                        bottom: 8,
                        right: 10,
                        child: FillButtons(
                          text: "Search",
                          height: 10,
                          width: 120,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
