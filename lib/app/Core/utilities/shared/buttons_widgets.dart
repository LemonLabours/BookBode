import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/spacing.dart';


class ButtonsWidgets extends StatelessWidget {
  const ButtonsWidgets(
      {super.key, this.onPressed, required this.text, this.icons});
  final Function()? onPressed;
  final String text;
  final IconData? icons;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: hWhiteColor,
        side: const BorderSide(color: hLightGray, style: BorderStyle.solid),
        fixedSize: const Size(380, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icons,
            color: hBlachColor,
          ),
          kHSpace16,
          Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
