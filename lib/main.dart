import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bookbode/app/Views/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app/Core/bloc/authentication_bloc/authentication_bloc.dart';





void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://zfwjwwdbhwoypbrcdeqc.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inpmd2p3d2RiaHdveXBicmNkZXFjIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTI4NjQzMjgsImV4cCI6MjAwODQ0MDMyOH0.3bJD7jBg95f4ZUWEEUgUx_98qPJWHIw5aC21aJ9QU9w',
  );

  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBloc(),
      child: MaterialApp(
        theme: ThemeData(),
        home: AnimatedSplashScreen(
          duration: 4000,
          splash: Image.asset('assets/imgs/BBLogo.png'),
          splashIconSize: 200.0,
          //nextScreen: const IntroView(),
          nextScreen: const Login(),

          splashTransition: SplashTransition.slideTransition,
          pageTransitionType: PageTransitionType.rightToLeftWithFade,
          backgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
