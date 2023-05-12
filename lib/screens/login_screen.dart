import 'package:fittrack/auth/helpers.dart';
import 'package:fittrack/screens/forgot_password_screen.dart';
import 'package:fittrack/widgets/app_icons_buttons.dart';
import 'package:fittrack/widgets/app_password_textfield.dart';
import 'package:fittrack/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

class UserLoginScreen extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const UserLoginScreen({super.key, required this.showRegisterPage});

  @override
  State<UserLoginScreen> createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends State<UserLoginScreen> {
  AuthService authenticationService = AuthService();
  bool isLoginButtonActive = false;
  final bool _isPasswordVisible = false;
  final _signInemailAddressController = TextEditingController();
  final _signInpasswordController = TextEditingController();  

  @override
  void initState() {
    super.initState();
    _signInpasswordController.addListener(() {
      final isLoginButtonActive = _signInpasswordController.text.isNotEmpty;
      setState(() => this.isLoginButtonActive = isLoginButtonActive);
     });
  }

  @override
  void dispose() {
    _signInemailAddressController.dispose();
    _signInpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
              const SizedBox(height: 50),
              Image.asset("assets/icons/dumbbell.png",height: 100, width: 100),
              const SizedBox(height: 35),
              const Text("Hey there,", style: TextStyle(fontSize: 20)),
              const SizedBox(height: 12,),
              const Text("Welcome Back", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
              const SizedBox(height: 25),
              AppTextField(
                placeholderIcon: LineIcon.envelope(),
                controller: _signInemailAddressController,
                hintText: 'Email',
                obscureText: false,
              ),
                const SizedBox(height: 10),
              AppPasswordTextField(
                placeholderIcon: LineIcon.lock(),
                controller: _signInpasswordController,
                hintText: 'Password',
                obscureText: !_isPasswordVisible, 
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context, 
                            MaterialPageRoute(
                              builder: (context) {
                              return const ForgotPasswordScreen();
                              },
                            ),
                        );
                      },
                      child: const Text(
                        'Forgot your password?',
                        style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100),

              // sign in button
              AppIconButtons(
                buttonPlaceholderText: "Login", 
                buttonPlaceholderIcon: LineIcon.doorOpen(),
                onButtonPress: isLoginButtonActive ? () async {
                  await authenticationService.userSignIn(
                    _signInemailAddressController.text.trim(), 
                    _signInpasswordController.text.trim(), 
                    context);
                } : null,
                ),
              const SizedBox(height: 50),

              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(
                  "Don't have an account yet?",
                  style: TextStyle(color: Colors.grey[700]),
                ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: widget.showRegisterPage,
                child: const Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ],
              ),
              const SizedBox(height: 50),
            ],  
          ),
        ],
        ), 
      ),
      ),
    );
  }
}