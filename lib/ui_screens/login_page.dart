import 'package:flutter/material.dart';
import 'package:med_buddy/ui_screens/signup_page.dart';
import 'package:med_buddy/widgets/welcome_med_buddy.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Login'),
        ),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              WelcomeMedBuddy(),

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
                hintText: 'Password',
                controller: passwordController,
                obscureText: !isPasswordVisible,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                suffixIcon: IconButton(
                  icon: Icon(isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
              ),
              SizedBox(height: 15), // Add space between password field and login button
              CustomButton(
                text: 'Login',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Handle login logic here
                  }
                },
                width: 200,
                height: 50,// Make the login button slightly larger
              ),
              SizedBox(height: 15), // Add space between login button and text
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center the text and button
                children: [
                  CustomText(
                    text: "Don't have an account? ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => SignupScreen()));
                    },
                    child: CustomText(
                      text: 'Sign Up',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
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
}
