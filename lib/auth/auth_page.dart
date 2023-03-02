import 'package:fittrack/screens/login_screen.dart';
import 'package:fittrack/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage =! showLoginPage;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return UserLoginScreen(showRegisterPage: toggleScreens);
    } else {
      return UserSignUpScreen(showLoginPage: toggleScreens);
    }
  }
}