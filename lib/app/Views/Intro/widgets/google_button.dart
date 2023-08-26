import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Core/bloc/authentication/bloc/authentication_bloc.dart';
import '../../../Core/utilities/shared/text_widgets.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        context.read<AuthenticationBloc>().add(SignInWithGoogleRequested());
      },
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            Image.asset('assets/imgs/google-logo.png', height: 40, width: 40),
      ),
      label: const ButtonText(text: 'Sign in with Google'),
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
    );
  }
}
