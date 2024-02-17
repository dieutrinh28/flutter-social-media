import 'package:flutter/material.dart';
import 'package:social_media_app/config/config.dart';
import 'package:social_media_app/widgets/widgets.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void onLogout() {
    }

    return Scaffold(
      appBar: CustomAppbar(
        title: "Settings",
        leadingIcon: Icons.highlight_remove_outlined,
        leadingPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                buildContent(
                  leadingIcon: Icons.edit_note,
                  title: "Edit",
                  onTap: () {},
                ),
                buildContent(
                  leadingIcon: Icons.language,
                  title: "Language",
                  moreInfo: "10+",
                  onTap: () {},
                ),
                buildContent(
                  leadingIcon: Icons.person_outline,
                  title: "Friends",
                  moreInfo: "200+ ",
                  onTap: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Preferences",
                  style: TextStyle(
                    color: ColorPalette.grayscaleDark,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                buildContent(
                  leadingIcon: Icons.notifications_off_outlined,
                  title: "Notifications",
                  onTap: () {},
                ),
                buildContent(
                  leadingIcon: Icons.privacy_tip,
                  title: "Account & Privacy",
                  onTap: () {},
                ),
                buildContent(
                  leadingIcon: Icons.mode_night_outlined,
                  title: "Theme",
                  moreInfo: "Dark, Light, Use System",
                  onTap: () {},
                ),
                buildContent(
                  leadingIcon: Icons.help_outline,
                  title: "Media X Help",
                  onTap: () {},
                ),
                buildContent(
                  leadingIcon: Icons.info_outline,
                  title: "About",
                  onTap: () {},
                ),
                CustomPrimaryButton(
                  text: "Logout",
                  onTap: onLogout,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildContent({
    required IconData leadingIcon,
    required String title,
    required Function()? onTap,
    String? moreInfo,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Icon(
              leadingIcon,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: const TextStyle(
                color: ColorPalette.grayscaleDark,
                fontSize: 16,
              ),
            ),
            const Expanded(child: SizedBox()),
            Text(
              moreInfo ?? "",
              style: const TextStyle(
                color: ColorPalette.brandPrimaryBase,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            const Icon(
              Icons.arrow_forward_ios,
            ),
          ],
        ),
      ),
    );
  }
}
