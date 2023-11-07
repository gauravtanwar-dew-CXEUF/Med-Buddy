import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;

  CustomTextField({
    required this.controller,
    required this.hintText,
    this.validator,
    this.obscureText = false, // Added to determine if the text should be obscured (password field)
    this.suffixIcon, // Added for optional suffix icon (password visibility toggle)
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
    child:TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      ),
      obscureText: obscureText,
      validator: validator,
    )
    );
  }
}

