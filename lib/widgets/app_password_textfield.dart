import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppPasswordTextField extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String hintText;
  final bool obscureText;
  final Icon placeholderIcon;
  bool istextVisble = false;

  AppPasswordTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.placeholderIcon, 
  });

  @override
  State<AppPasswordTextField> createState() => _AppPasswordTextFieldState();
}

class _AppPasswordTextFieldState extends State<AppPasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        controller: widget.controller,
        obscureText: !widget.istextVisble,
        decoration: InputDecoration(
          prefixIcon: IconTheme(
            data: const IconThemeData(size: 22),
            child: widget.placeholderIcon,
            ),
            suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                widget.istextVisble = !widget.istextVisble;
                              });
                            },
                            icon: Icon(
                                widget.istextVisble? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black.withOpacity(0.5))),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.grey[500], fontSize: 13)),
      ),
    );
  }
}