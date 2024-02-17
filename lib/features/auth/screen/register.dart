import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/config/config.dart';
import 'package:social_media_app/widgets/widgets.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppbar(
        title: "Create Account",
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildWelcome(),
              buildRegisterForm(context),
              const Expanded(
                child: SizedBox(),
              ),
              buildAgreePolicy(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildWelcome() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: ColorPalette.grayscaleDark,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Create Account to keep exploring amazing destinations around the world',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: ColorPalette.grayscaleText,
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget buildRegisterForm(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    void onRegisterClick() {
      Navigator.pushNamed(
        context,
        '/',
      );
    }

    void navigateToLoginScreen() {
      Navigator.pushNamed(
        context,
        '/login',
      );
    }

    return Column(
      children: [
        CustomInput(
          icon: Icons.person_outline,
          hintText: 'Enter your full name',
          controller: nameController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "This field is required";
            }
            return null;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        CustomInput(
          icon: Icons.email_outlined,
          hintText: 'Enter your email address',
          controller: emailController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "This field is required";
            }
            if (!RegExp(
              r"^[a-zA-Z\d.]+@[a-zA-Z\d]+\.[a-zA-Z]+",
            ).hasMatch(value)) {
              return "Email invalid";
            }
            return null;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        CustomInput(
          icon: Icons.lock_outline,
          hintText: 'Enter password',
          controller: passwordController,
          obscureText: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "This field is required";
            }
            if (value.length < 6) {
              return "Password must from 6 chars";
            }
            return null;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        CustomInput(
          icon: Icons.lock_outline,
          hintText: 'Enter confirm password',
          controller: confirmPasswordController,
          obscureText: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "This field is required";
            }
            if (value != passwordController.text) {
              return "Confirm password does not match";
            }
            return null;
          },
        ),
        const SizedBox(
          height: 30,
        ),
        CustomPrimaryButton(
          text: 'Create Account',
          onTap: onRegisterClick,
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
              const TextSpan(text: 'Already have an account? '),
              TextSpan(
                text: 'Sign in',
                style: const TextStyle(
                  color: ColorPalette.brandPrimaryBase,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = navigateToLoginScreen,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildAgreePolicy() {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: ColorPalette.grayscaleDark,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'By creating an account, you agree to our\n',
          ),
          TextSpan(
            text: 'Terms & Conditions ',
            style: TextStyle(
              color: ColorPalette.brandPrimaryBase,
            ),
          ),
          TextSpan(text: 'and agree to '),
          TextSpan(
            text: 'Privacy Policy',
            style: TextStyle(
              color: ColorPalette.brandPrimaryBase,
            ),
          ),
        ],
      ),
    );
  }
}
