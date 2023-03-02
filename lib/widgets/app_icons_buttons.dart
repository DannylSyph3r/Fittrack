import 'package:fittrack/utils/theme_colors.dart';
import 'package:flutter/material.dart';

class AppIconButtons extends StatelessWidget {
  final String buttonPlaceholderText;
  final Function()? onButtonPress;
  final Icon? buttonPlaceholderIcon;

  const AppIconButtons({super.key, required this.buttonPlaceholderText, this.onButtonPress, required this.buttonPlaceholderIcon,});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onButtonPress, 
      icon: buttonPlaceholderIcon!, 
      label: Text(buttonPlaceholderText, style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(8),
        fixedSize: const Size(315, 60),
        backgroundColor: CustomColors.buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        )
      ),
    );
  }
}