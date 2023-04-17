import 'package:flutter/material.dart';

class MetricChangeTextField extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String hintText;
  final bool obscureText;
  final Icon placeholderIcon;
  // ignore: prefer_typing_uninitialized_variables
  final keyboardType;

  const MetricChangeTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.placeholderIcon, 
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon: IconTheme(
            data: const IconThemeData(size: 22),
            child: placeholderIcon,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[500], fontSize: 13)),
      ),
    );
  }
}