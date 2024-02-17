import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/config/config.dart';
import 'package:social_media_app/widgets/widgets.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppbar(
        title: "Log in",
        leadingIcon: Icons.arrow_back_ios_new,
        leadingText: "Back",
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: ColorPalette.grayscaleDark,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Login to keep exploring amazing destinations around the world!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: ColorPalette.grayscaleText,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              buildLoginForm(context),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildLoginForm(BuildContext context) {
    final TextEditingController identifierController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    void onLoginClick() {
      Navigator.pushNamed(
        context,
        '/',
      );
    }

    void navigateToRegisterScreen() {
      Navigator.pushNamed(
        context,
        '/register',
      );
    }

    return Column(
      children: [
        CustomInput(
          icon: Icons.person_outline,
          hintText: "Enter email or username",
          controller: identifierController,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomInput(
          icon: Icons.lock_outline,
          hintText: "Enter your password",
          controller: passwordController,
          obscureText: true,
        ),
        const SizedBox(
          height: 30,
        ),
        CustomPrimaryButton(
          text: 'Login',
          onTap: onLoginClick,
        ),
        const SizedBox(
          height: 10,
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: ColorPalette.grayscaleDark,
            ),
            children: <TextSpan>[
              const TextSpan(text: "Don't have an account? "),
              TextSpan(
                text: 'Sign up',
                style: const TextStyle(
                  color: ColorPalette.brandPrimaryBase,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = navigateToRegisterScreen,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
