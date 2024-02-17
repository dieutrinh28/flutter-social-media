import 'package:flutter/material.dart';
import 'package:social_media_app/config/config.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({super.key});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool _isSwitchOn = false;

  void _toggleSwitchChanged(bool value) {
    setState(() {
      _isSwitchOn = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _isSwitchOn,
      onChanged: _toggleSwitchChanged,
      activeTrackColor: ColorPalette.brandPrimaryBase,
      activeColor: Colors.white,
      inactiveTrackColor: ColorPalette.grayscaleText.withOpacity(0.4),
      inactiveThumbColor: Colors.white,
      trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
    );
  }
}
