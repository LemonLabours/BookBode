import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class LargeTitle extends StatelessWidget {
  final String text;

  const LargeTitle({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width * 0.13;

    return Text(
      text,
      style: GoogleFonts.raleway(
        textStyle: TextStyle(
          color: Colors.white,
          letterSpacing: .5,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class ParagraphText extends StatelessWidget {
  final String text;

  const ParagraphText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width * 0.04;

    return Text(
      text,
      style: GoogleFonts.raleway(
        textStyle: TextStyle(
          color: Colors.black,
          letterSpacing: .5,
          fontSize: fontSize,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}

class CenteredParagraphText extends StatelessWidget {
  final String text;

  const CenteredParagraphText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width * 0.06;

    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.raleway(
        textStyle: TextStyle(
          color: Colors.black,
          letterSpacing: .5,
          height: 1.5,
          fontSize: fontSize,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}

class SubTitle extends StatelessWidget {
  final String text;

  const SubTitle({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width * 0.03;
    return Text(
      text,
      style: GoogleFonts.raleway(
        textStyle: TextStyle(
          color: Colors.black,
          letterSpacing: .5,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class ButtonText extends StatelessWidget {
  final String text;

  const ButtonText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width * 0.04;

    return Text(
      text,
      style: GoogleFonts.raleway(
        textStyle: TextStyle(
          color: Colors.black,
          letterSpacing: .5,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class FormTitle extends StatelessWidget {
  final String text;

  const FormTitle({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width * 0.1;

    return Stack(
      alignment: Alignment.center,
      children: [
        // Outer text with stroke
        Text(
          text,
          style: GoogleFonts.raleway(
            textStyle: TextStyle(
              letterSpacing: .5,
              fontSize: fontSize + 1,
              fontWeight: FontWeight.bold,
              color: secondary,
            ),
          ),
        ),
        // Inner text with fill color
        Text(
          text,
          style: GoogleFonts.raleway(
            textStyle: TextStyle(
              letterSpacing: .5,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: primary,
            ),
          ),
        ),
      ],
    );
  }
}
