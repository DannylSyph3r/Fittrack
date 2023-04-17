import 'package:fittrack/auth/helpers.dart';
import 'package:fittrack/widgets/app_buttons.dart';
import 'package:fittrack/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

class UserSignUpScreen extends StatefulWidget {
  final VoidCallback showLoginPage;
  const UserSignUpScreen({super.key, required this.showLoginPage});

  @override
  State<UserSignUpScreen> createState() => _UserSignUpScreenState();
}

class _UserSignUpScreenState extends State<UserSignUpScreen> {
  AuthService authenticationService = AuthService();
  final _signUpemailAddressController = TextEditingController();
  final _signUppasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _signUpemailAddressController.dispose();
    _signUppasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  bool passwordConfirmed() {
    if (_signUppasswordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
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
              children: [
                const SizedBox(height: 50),
                Image.asset("assets/icons/dumbbell.png",
                    height: 100, width: 100),
                const SizedBox(height: 35),
                const Text("Hey there,", style: TextStyle(fontSize: 20)),
                const SizedBox(
                  height: 15,
                ),
                const Text("Create an Account",
                    style:
                        TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                const SizedBox(height: 25),
                AppTextField(
                    controller: _firstNameController,
                    hintText: "First Name",
                    obscureText: false,
                    placeholderIcon: LineIcon.user()),
                const SizedBox(height: 10),
                AppTextField(
                    controller: _lastNameController,
                    hintText: "Last Name",
                    obscureText: false,
                    placeholderIcon: LineIcon.user()),
                const SizedBox(height: 10),
                AppTextField(
                  controller: _signUpemailAddressController,
                  hintText: "Email",
                  obscureText: false,
                  placeholderIcon: LineIcon.envelope(),
                ),
                const SizedBox(height: 10),
                AppTextField(
                  controller: _signUppasswordController,
                  hintText: "Password",
                  obscureText: true,
                  placeholderIcon: LineIcon.lock(),
                ),
                const SizedBox(height: 10),
                AppTextField(
                  controller: _confirmPasswordController,
                  hintText: "Confirm Password",
                  obscureText: true,
                  placeholderIcon: LineIcon.lock(),
                ),
                const SizedBox(height: 70),

                // sign in button
                AppButtons(
                    buttonPlaceholderText: "Register",
                    onButtonPress: () async {
                      if ((_firstNameController.text.isNotEmpty) &&
                          (_lastNameController.text.isNotEmpty) &&
                          (_signUpemailAddressController.text.isNotEmpty) &&
                          (_signUppasswordController.text.isNotEmpty) &&
                          (_confirmPasswordController.text.isNotEmpty) &&
                          (passwordConfirmed() == false)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Passwords do not match!")),
                        );
                      } else if ((_firstNameController.text.isNotEmpty) &&
                          (_lastNameController.text.isNotEmpty) &&
                          (_signUpemailAddressController.text.isNotEmpty) &&
                          (_signUppasswordController.text.isNotEmpty) &&
                          (_confirmPasswordController.text.isNotEmpty) &&
                          (passwordConfirmed() == true)) {
                        if (passwordConfirmed()) {
                          await authenticationService.userRegistrationSequence(
                              _signUpemailAddressController.text.trim(),
                              _signUppasswordController.text.trim(),
                              _firstNameController.text.trim(),
                              _lastNameController.text.trim(),
                              context,
                              );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Please fill out all textfields!")),
                        );
                      }
                    }),
                const SizedBox(height: 50),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: const Text(
                        'Login',
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
        )),
      ),
    );
  }
}
