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
        child: Center(
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/imgs/google-logo.png',
                  height: 40, width: 40),
            ),
            label: const Text(
              'Sign in with Google',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              side: const BorderSide(
                color: Colors.black,
                width: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
