import 'package:flutter/material.dart';
import '../../Core/services/Authentication/authentication.dart';
import '../../Core/utilities/constants/colors.dart';
import '../Home/home_view.dart';

class IntroView extends StatefulWidget {
  const IntroView({super.key});

  @override
  createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  bool _isLoading = false;
  final AuthenticationService _authService = AuthenticationService();

  void _signInAndNavigate() async {
    NavigatorState navigator = Navigator.of(context);

    setState(() {
      _isLoading = true;
    });

    try {
      await _authService.signInWithGoogle();
      // Navigate to HomeView after successful authentication
      navigator.pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeView()));
    } catch (error) {
      // ignore: avoid_print
      print("Error signing in: $error");
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: babyAndDarkBlueGradient),
        child: Center(
          child: _isLoading
              ? const CircularProgressIndicator()
              : ElevatedButton.icon(
                  onPressed: _signInAndNavigate,
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
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
