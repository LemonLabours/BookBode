import 'package:flutter/material.dart';

const kVSpace4 = SizedBox(height: 4);
const kVSpace8 = SizedBox(height: 8);
const kVSpace16 = SizedBox(height: 16);
const kVSpace32 = SizedBox(height: 32);
const kVSpace64 = SizedBox(height: 64);
const kVSpace128 = SizedBox(height: 128);

const kHSpace4 = SizedBox(width: 4);
const kHSpace8 = SizedBox(width: 8);
const kHSpace16 = SizedBox(width: 16);
const kHSpace32 = SizedBox(width: 32);
const kHSpace64 = SizedBox(width: 64);
const kHSpace128 = SizedBox(width: 128);




class ResponsiveSpacing {
  static SizedBox height(BuildContext context, double factor) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(height: screenWidth * factor);
  }

  static SizedBox width(BuildContext context, double factor) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(width: screenWidth * factor);
  }
}


const small = 0.05;
const large = 0.1;
const medium = 0.07;
const xlarge = 0.15;
const xxlarge = 0.2;
const xxxlarge = 0.25;
const xxxxlarge = 0.3;
const xxxxxlarge = 0.45;
