import 'package:flutter/material.dart';
import '../widgets/custome_button.dart';
import '../widgets/custome_text.dart';
import '../widgets/custome_text_field.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                hintText: 'First Name',
                controller: firstNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
              ),
              CustomTextField(
                hintText: 'Last Name',
                controller: lastNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
              ),
              CustomTextField(
                hintText: 'Email',
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!isValidEmail(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              CustomTextField(
                hintText: 'Mobile Number',
                controller: mobileController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your mobile number';
                  }
                  if (!isValidPhoneNumber(value)) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
              ),
              CustomTextField(
                hintText: 'Password',
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              CustomButton(
                text: 'Sign Up',
                onPressed: () {
                  if (_validateFields()) {
                    // All fields are valid, you can save the data locally or perform further actions
                  }
                },
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Navigate back to the login screen
                },
                child: CustomText(
                  text: 'Already have an account? Login',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isValidEmail(String? email) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return email != null && emailRegex.hasMatch(email);
  }

  bool isValidPhoneNumber(String? phone) {
    final phoneRegex = RegExp(r'^[0-9]{10}$');
    return phone != null && phoneRegex.hasMatch(phone);
  }

  bool _validateFields() {
    return firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        isValidEmail(emailController.text) &&
        isValidPhoneNumber(mobileController.text) &&
        passwordController.text.isNotEmpty;
  }
}
