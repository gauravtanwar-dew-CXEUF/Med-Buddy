import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/welcome_med_buddy.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Sign Up'),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction, // Trigger validation on user interaction
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WelcomeMedBuddy(),

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
                    if (_formKey.currentState!.validate()) {
                      // All fields are valid, you can save the data locally or perform further actions
                    }
                  },
                ),

                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Navigate back to the login screen
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "Already have an account? ",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal, // Remove the bold style
                        ),
                      ),
                      CustomText(
                        text: 'Login',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
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
}
