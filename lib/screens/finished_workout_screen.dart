import 'package:firebase_auth/firebase_auth.dart';
import 'package:fittrack/auth/helpers.dart';
import 'package:fittrack/widgets/app_buttons.dart';
import 'package:fittrack/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class FinishedWorkoutScreen extends StatefulWidget {
  final String workoutDuration;
  final int totalCaloriesBurnt;
  const FinishedWorkoutScreen(
      {super.key,
      required this.workoutDuration,
      required this.totalCaloriesBurnt});

  @override
  State<FinishedWorkoutScreen> createState() => _FinishedWorkoutScreenState();
}

class _FinishedWorkoutScreenState extends State<FinishedWorkoutScreen> {
  AuthService authenticationService = AuthService();
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/onboard_4.png",
                    height: 327,
                    width: 260,
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Flexible(
                    child: Text(
                      "Congratulations, You Have Finished Your Workout",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Flexible(
                    child: Text(
                      "Exercises is king and nutrition is queen. Combine the two and you will have a kingdom",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "-Jack Lalanne",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    LineIcons.medal,
                    size: 30,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Workout Statistics",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Workout Duration : ${widget.workoutDuration} ",
                    style: const TextStyle(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      "Total Calories Burnt : ${widget.totalCaloriesBurnt} kcals",
                      style: const TextStyle(fontWeight: FontWeight.w400))
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              AppButtons(
                  onButtonPress: () async {
                    if (user != null) {
                      await authenticationService.recordUserActivityDetails(
                          context,
                          user!.email!,
                          widget.workoutDuration,
                          widget.totalCaloriesBurnt);
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FitTrackNavBar()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please log in first')));
                    }
                  },
                  buttonPlaceholderText: "Back to Home"),
              const SizedBox(
                height: 15,
              )
            ]),
          ),
        ),
      )),
    );
  }
}
