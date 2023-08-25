import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/spacing.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
      this.obscureText,
      this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.inputType,
      this.maxLines,
      this.textController,
      this.onSubmitted,
      required this.lebel,
      this.height,
      this.width});

  final bool? obscureText;
  final String? hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextInputType? inputType;
  final int? maxLines;
  final TextEditingController? textController;
  final Function(String)? onSubmitted;
  final String lebel;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lebel,
          style: const TextStyle(
              color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 16),
        ),
        kVSpace8,
        SizedBox(
          height: height,
          width: width,
          child: TextField(
            style: const TextStyle(color: hBlachColor, fontSize: 16),
            keyboardType: inputType,
            maxLines: maxLines,
            obscureText: obscureText ?? false,
            onSubmitted: onSubmitted,
            controller: textController,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
              prefixIcon: Icon(prefixIcon),
              suffixIcon: Icon(suffixIcon),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: hLightGray,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
