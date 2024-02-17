import 'package:flutter/material.dart';
import 'package:social_media_app/config/config.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final IconData? leadingIcon;
  final String? leadingText;
  final void Function()? leadingPressed;
  final String title;
  final IconData? actionIcon;
  final String? actionText;
  final void Function()? actionPressed;
  final bool baseColor;

  CustomAppbar({
    super.key,
    this.title = "",
    this.leadingIcon,
    this.leadingText,
    this.actionIcon,
    this.actionText,
    this.baseColor = true,
    this.leadingPressed,
    this.actionPressed,
  });

  final double appbarHeight = AppBar().preferredSize.height;

  @override
  Size get preferredSize => Size.fromHeight(appbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      title: Text(
        title,
        style: TextStyle(
          color: baseColor ? Colors.white : ColorPalette.brandPrimaryBase,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      backgroundColor: baseColor ? ColorPalette.brandPrimaryBase : Colors.white,
      leadingWidth: 100,
      leading: InkWell(
        onTap: leadingPressed,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Icon(
                leadingIcon,
                color: baseColor ? Colors.white : ColorPalette.brandPrimaryBase,
              ),
              if (leadingText != null)
                Text(
                  leadingText!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: baseColor ? Colors.white : ColorPalette.brandPrimaryBase,
                  ),
                ),
            ],
          ),
        ),
      ),
      actions: [
        InkWell(
          onTap: actionPressed,
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                if (actionText != null)
                  Text(
                    actionText!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: baseColor ? Colors.white : ColorPalette.brandPrimaryBase,
                    ),
                  ),
                if (actionIcon != null)
                  Icon(
                    actionIcon,
                    color: baseColor ? Colors.white : ColorPalette.brandPrimaryBase,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
