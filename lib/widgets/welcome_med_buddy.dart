import 'package:flutter/material.dart';

class WelcomeMedBuddy extends StatelessWidget {
  const WelcomeMedBuddy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // MedBuddy text with icon
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.medical_services, // You can use an appropriate medical icon
              size: 36, // Set the desired icon size
              color: Colors.blue, // Change the icon color
            ),
            Text(
              'Med~Buddy',
              style: TextStyle(
                fontSize: 36, // Set the desired font size
                fontWeight: FontWeight.bold, // Adjust the font weight
                color: Colors.blue, // Change the text color
              ),
            ),
          ],
        ),
        // Short and creative welcome message
        Text(
          'Your Health Companion',
          style: TextStyle(
            fontSize: 18, // Set the desired font size for the message
            fontStyle: FontStyle.italic, // Apply italic style
            color: Colors.black, // Change the message text color
          ),
        ),
      ],
    );
  }
}

