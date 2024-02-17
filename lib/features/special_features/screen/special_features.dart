import 'package:flutter/material.dart';
import 'package:social_media_app/widgets/custom_appbar.dart';
import 'package:social_media_app/widgets/custom_primary_button.dart';

class SpecialFeaturesScreen extends StatelessWidget {
  const SpecialFeaturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Special Features",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                CustomPrimaryButton(
                  text: "Special Requests",
                  onTap: () {
                    Navigator.pushNamed(context, "/special-requests");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
