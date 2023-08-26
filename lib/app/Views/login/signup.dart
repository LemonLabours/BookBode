import 'package:bookbode/app/Core/utilities/constants/colors.dart';
import 'package:bookbode/app/Core/utilities/constants/nav_extension.dart';
import 'package:bookbode/app/Core/utilities/constants/spacing.dart';
import 'package:bookbode/app/Core/utilities/shared/fill_buttons.dart';
import 'package:bookbode/app/Core/utilities/shared/sheet_layout_widget.dart';
import 'package:bookbode/app/Core/utilities/shared/text_fields_widgets.dart';
import 'package:bookbode/app/Views/Home/home_view.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(gradient: babyAndDarkBlueGradient),
      child: Stack(
        children: [
          BottomContainer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Create New Account',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: hBlachColor),
                ),
                kVSpace32,
                const TextFieldWidget(
                  prefixIcon: Icons.mail_outlined,
                  lebel: "Name",
                ),
                kVSpace16,
                const TextFieldWidget(
                  prefixIcon: Icons.mail_outlined,
                  lebel: "Email",
                ),
                kVSpace16,
                const TextFieldWidget(
                  prefixIcon: Icons.lock_outlined,
                  lebel: "Password",
                ),
                kVSpace16,
                const TextFieldWidget(
                  prefixIcon: Icons.lock_outlined,
                  lebel: "Confirm Password",
                ),
                kVSpace32,
                FillButtons(
                  text: 'Sign Up',
                  onPressed: () {
                    context.pushAndRemove(
                      path: const HomeView(),
                    );
                  },
                ),
                kVSpace16,
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
