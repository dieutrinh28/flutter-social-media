import 'package:flutter/material.dart';
import 'package:social_media_app/config/config.dart';

class CustomInput extends StatefulWidget {
  final IconData icon;
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  bool isHiddenPassword;
  final String? Function(String?)? validator;

  CustomInput({
    super.key,
    required this.icon,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.isHiddenPassword = false,
    this.validator,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  String? _errorText;

  String? _validateInput(String? value) {
    if (widget.validator != null) {
      final customValidatorResult = widget.validator!(value);
      if (customValidatorResult != null) {
        setState(() {
          _errorText = customValidatorResult;
        });
        return '';
      }
    }
    setState(() {
      _errorText = null;
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            color: ColorPalette.grayscaleText.withOpacity(0.05),
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextFormField(
            validator: _validateInput,
            obscureText: widget.isHiddenPassword,
            obscuringCharacter: '*',
            controller: widget.controller,
            style: const TextStyle(
              color: ColorPalette.grayscaleDark,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
            decoration: InputDecoration(
              icon: Icon(
                widget.icon,
                color: ColorPalette.grayscaleText.withOpacity(0.4),
                size: 24,
              ),
              suffixIcon: widget.obscureText
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          widget.isHiddenPassword = !widget.isHiddenPassword;
                        });
                      },
                      icon: Icon(
                        widget.isHiddenPassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: 24,
                      ),
                    )
                  : null,
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: ColorPalette.grayscaleText.withOpacity(0.4),
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              errorStyle: const TextStyle(height: 0),
              border: InputBorder.none,
            ),
          ),
        ),
        if (_errorText != null)
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              '*$_errorText!',
              style: const TextStyle(
                color: ColorPalette.tertiary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
      ],
    );
  }
}
