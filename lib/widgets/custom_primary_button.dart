import 'package:flutter/material.dart';
import 'package:social_media_app/config/config.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const CustomPrimaryButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 20),
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorPalette.brandPrimaryBase,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            const Icon(
              Icons.arrow_forward_outlined,
              size: 24,
              color: Colors.white,
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
