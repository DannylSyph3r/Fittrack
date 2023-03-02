import 'package:firebase_auth/firebase_auth.dart';
import 'package:fittrack/screens/initialized_screen.dart';
import 'package:fittrack/screens/login_screen.dart';
import 'package:fittrack/utils/theme_colors.dart';
import 'package:flutter/material.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key, required String firstName});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text("Welcome ${user.email!}",
                    style: const TextStyle(fontSize: 20)),
                const SizedBox(
                  height: 15,
                ),
                MaterialButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const InitializedScreen()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  color: CustomColors.buttonColor,
                  child: const Text("Sign out"),
                )
              ]),
        ),
      ),
    );
  }
}
