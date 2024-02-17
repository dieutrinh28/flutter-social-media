import 'package:flutter/material.dart';
import 'package:social_media_app/config/config.dart';

class CustomSecondaryButton extends StatelessWidget {
  final IconData? icon;
  final String text;
  final void Function()? onTap;
  const CustomSecondaryButton({
    super.key,
    this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 8, right: 10),
        height: 32,
        decoration: BoxDecoration(
          color: ColorPalette.brandPrimaryBase,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              icon,
              size: 16,
              color: Colors.white,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
