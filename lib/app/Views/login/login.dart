import 'package:bookbode/app/Core/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:bookbode/app/Core/utilities/constants/colors.dart';
import 'package:bookbode/app/Core/utilities/constants/nav_extension.dart';
import 'package:bookbode/app/Core/utilities/constants/spacing.dart';
import 'package:bookbode/app/Core/utilities/shared/buttons_widgets.dart';
import 'package:bookbode/app/Core/utilities/shared/fill_buttons.dart';
import 'package:bookbode/app/Core/utilities/shared/nav_bar_view.dart';
import 'package:bookbode/app/Core/utilities/shared/sheet_layout_widget.dart';
import 'package:bookbode/app/Core/utilities/shared/text_fields_widgets.dart';
import 'package:bookbode/app/Core/utilities/shared/text_widgets.dart';
import 'package:bookbode/app/Views/login/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
                    kVSpace32,
                    const TextFieldWidget(
                      prefixIcon: Icons.mail_outlined,
                      lebel: "Email",
                    ),
                    kVSpace16,
                    const TextFieldWidget(
                      prefixIcon: Icons.lock_outlined,
                      lebel: "Password",
                    ),
                    kVSpace32,
                    FillButtons(
                      text: 'Login',
                      onPressed: () {},
                    ),
                    kVSpace4,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                            onPressed: () {
                              context.push(
                                path: const SignUp(),
                              );
                            },
                            child: const Text(
                              "Sign up",
                              style: TextStyle(
                                  color: primary, fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                    kVSpace4,
                    const ButtonsWidgets(
                      text: "Continue with phone number",
                      icons: Icons.phone,
                    ),
                    kVSpace16,
                    Center(
                      child: state is AuthenticationInProgress
                          ? const CircularProgressIndicator()
                          : ButtonsWidgets(
                              image: "assets/imgs/google-logo.png",
                              text: "Continue with google",
                              onPressed: () {
                                context
                                    .read<AuthenticationBloc>()
                                    .add(SignInWithGoogleRequested());
                              },
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
      },
    );
  }
}
