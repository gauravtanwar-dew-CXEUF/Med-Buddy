import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double? height; // Added height parameter

  CustomButton({
    required this.text,
    required this.onPressed,
    this.width, // Added width and height to the constructor
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width, // Use the provided width or null if not provided
      height: height, // Use the provided height or null if not provided
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text,style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        )),
      ),
    );
  }
}
