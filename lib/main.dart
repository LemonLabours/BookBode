import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_3/app/Views/Intro/intro_view.dart';
import 'app/Core/utilities/constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: AnimatedSplashScreen(
        duration: 4000,
        splash: Image.asset('assets/imgs/BBLogo.png'),
        splashIconSize: 200.0,
        nextScreen: const IntroView(),
        splashTransition: SplashTransition.slideTransition,
        pageTransitionType: PageTransitionType.rightToLeftWithFade,
        backgroundColor: secondary,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
