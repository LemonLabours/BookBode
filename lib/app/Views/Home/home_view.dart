import 'package:flutter/material.dart';
import '../../Core/utilities/constants/colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: babyAndDarkBlueGradient),
      ),
    );
  }
}
