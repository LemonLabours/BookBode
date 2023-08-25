import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Core/bloc/authentication/bloc/authentication_bloc.dart';
import '../../Core/utilities/constants/colors.dart';
import '../../Core/utilities/shared/nav_bar_view.dart';

class IntroView extends StatefulWidget {
  const IntroView({super.key});

  @override
  createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationSuccess) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const NavBarView()));
        } else if (state is AuthenticationFailed) {
          // Delayed to ensure the context is still valid
          Future.delayed(const Duration(milliseconds: 500), () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(gradient: babyAndDarkBlueGradient),
            child: Center(
              child: state is AuthenticationInProgress
                  ? const CircularProgressIndicator()
                  : ElevatedButton.icon(
                      onPressed: () {
                        context
                            .read<AuthenticationBloc>()
                            .add(SignInWithGoogleRequested());
                      },
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
      },
    );
  }
}
