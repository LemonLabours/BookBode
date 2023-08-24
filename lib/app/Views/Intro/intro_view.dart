import 'package:flutter/material.dart';

import '../../Core/utilities/constants/colors.dart';

class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: babyAndDarkBlueGradient,
        ),
        // Rest of your scaffold's content here...
      ),
    );
  }
}
