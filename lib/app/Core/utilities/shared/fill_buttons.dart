import 'package:flutter/material.dart';
import 'package:gradient_elevated_button/gradient_elevated_button.dart';

import '../constants/colors.dart';


class FillButtons extends StatelessWidget {
  const FillButtons(
      {super.key,
      this.onPressed,
      required this.text,
      this.height = 50,
      this.width = 380});
  final Function()? onPressed;
  final String text;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GradientElevatedButton(
        onPressed: onPressed,
        style: GradientElevatedButton.styleFrom(
            fixedSize: Size(width, height),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            gradient: const LinearGradient(
              colors: [Color(0xFF5d78ff), Color(0xFF23bffe)],
            )),
        child:  Text(
          text,
          style: const TextStyle(color: hWhiteColor, fontSize: 18),
        ));
  }
}
