import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fittrack/screens/home_screen_fittrack.dart';
import 'package:fittrack/widgets/app_buttons.dart';
import 'package:fittrack/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';

class SignUpWelcomeScreen extends StatelessWidget {
  const SignUpWelcomeScreen({Key? key});

  void goToHomeScreen(BuildContext context) async {
    final User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final QuerySnapshot userQuery = await FirebaseFirestore.instance
          .collection('fittrackUsers')
          .where('email', isEqualTo: user.email)
          .get();
      final DocumentSnapshot userDoc = userQuery.docs.first;
      final String firstName = userDoc['firstname'];
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const FitTrackNavBar(
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Ermmm there seems to be no user logged in :( "),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              Column(children: [
                const SizedBox(height: 102),
                Image.asset("assets/images/signup_welcome.png",
                    height: 304, width: 278),
                const SizedBox(height: 50),
                FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection('fittrackUsers')
                      .where('email', isEqualTo: FirebaseAuth.instance.currentUser?.email)
                      .get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      final DocumentSnapshot userDoc = snapshot.data!.docs.first;
                      final String firstName = userDoc['firstname'];
                      return Text(
                        "Welcome, $firstName",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                const SizedBox(height: 5),
                const Text(
                  "You are all set now, let’s reach your",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                const Text(
                  "goals together with us",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 191),
                AppButtons(
                    onButtonPress: () {
                      goToHomeScreen(context);
                    },
                    buttonPlaceholderText: "Go To Home"),
                const SizedBox(height: 40),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
