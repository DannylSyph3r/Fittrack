import 'package:fittrack/auth/helpers.dart';
import 'package:fittrack/utils/theme_colors.dart';
import 'package:fittrack/widgets/app_buttons.dart';
import 'package:fittrack/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';


class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  AuthService authenticationService = AuthService();
  final _forgotPasswordEmailFieldController = TextEditingController();

  @override
  void dispose() {
    _forgotPasswordEmailFieldController.dispose();
    super.dispose();
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.appBarColor,
        elevation: 0,
      ) ,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0 ),
            child: Text("Enter your Email and we will send you a password reset link", textAlign: TextAlign.center,),
          ),
          const SizedBox(height: 10),
          AppTextField(
            controller: _forgotPasswordEmailFieldController, 
            hintText: "Email", 
            obscureText: false, 
            placeholderIcon: LineIcon.lock(),
            ),
            const SizedBox(height: 30),
            AppButtons(
              onButtonPress: () async {
                await authenticationService.userPasswordReset(
                  _forgotPasswordEmailFieldController.text.trim(), 
                  context);
              },
              buttonPlaceholderText: "Reset Password")
        ],
      ),
    );
  }
}