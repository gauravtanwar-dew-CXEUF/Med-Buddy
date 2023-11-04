import 'package:flutter/material.dart';

class BackgroundPage extends StatelessWidget {
  final Widget childWidget;

  const BackgroundPage({super.key, required this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background_blue.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          childWidget,
        ],
      ),
    );
  }
}
