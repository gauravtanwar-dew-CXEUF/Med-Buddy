import 'package:flutter/material.dart';

import '../widgets/custome_button.dart';
import '../widgets/custome_text_field.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(hintText: 'Email', controller: emailController),
            CustomTextField(hintText: 'Password', controller: passwordController),
            CustomButton(
              text: 'Login',
              onPressed: () {
                // Handle login logic here
              },
            ),
          ],
        ),
      ),
    );
  }
}