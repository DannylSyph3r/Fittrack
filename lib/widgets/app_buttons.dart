import 'package:fittrack/utils/theme_colors.dart';
import 'package:flutter/material.dart';

class AppButtons extends StatelessWidget {
  final String buttonPlaceholderText;
  final Function()? onButtonPress;


  const AppButtons({super.key, required this.buttonPlaceholderText, this.onButtonPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onButtonPress, 
       style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(8),
        fixedSize: const Size(315, 60),
        backgroundColor: CustomColors.buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        )
       ),
       child: Text(buttonPlaceholderText, style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
        ),
       ),
      );
  }
}