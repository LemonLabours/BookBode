import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Core/bloc/authentication/bloc/authentication_bloc.dart';
import '../../Core/utilities/constants/colors.dart';
import '../../Core/utilities/constants/spacing.dart';
import '../../Core/utilities/shared/nav_bar_view.dart';
import '../../Core/utilities/shared/sheet_layout_widget.dart';
import '../../Core/utilities/shared/text_widgets.dart';
import 'widgets/google_button.dart';

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
            child: Stack(
              children: [
                BottomContainer(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const FormTitle(text: 'BookBode'),
                      ResponsiveSpacing.height(context, xxxlarge),
                      const CenteredParagraphText(
                          text:
                              'Experience luxury at your fingertips. Discover and book the finest hotels with BookBode.'),
                      ResponsiveSpacing.height(context, xxlarge),
                      Center(
                        child: state is AuthenticationInProgress
                            ? const CircularProgressIndicator()
                            : const GoogleSignInButton(),
                      ),
                      ResponsiveSpacing.height(context, xlarge),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
