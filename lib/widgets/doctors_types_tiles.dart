import 'package:flutter/material.dart';

class DoctorsTypeTiles extends StatelessWidget {
  final String type;
  final String icon;
  final Color backgroundColor;

  DoctorsTypeTiles({
    required this.type,
    required this.icon,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle the tile click, e.g., navigate to a specific doctor list for this type.
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/$icon',
              width: 64,
              height: 64,
              // Replace 'assets/' with the actual path to your icons.
            ),
            SizedBox(height: 16),
            Text(
              type,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
