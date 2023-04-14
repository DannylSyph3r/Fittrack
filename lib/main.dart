import 'package:firebase_core/firebase_core.dart';
import 'package:fittrack/models/exercises.dart';
import 'package:fittrack/screens/activity_tracker_screen.dart';
import 'package:fittrack/screens/complete_profile_screen.dart';
import 'package:fittrack/screens/exercise_screen.dart';
import 'package:fittrack/screens/finished_workout_screen.dart';
import 'package:fittrack/screens/initialized_screen.dart';
import 'package:fittrack/screens/onboarding.dart';
import 'package:fittrack/screens/settings_screen.dart';
import 'package:fittrack/screens/signup_welcome_screen.dart';
import 'package:fittrack/screens/workout_screen.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      title: 'Fittrack',
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const OnboardingScreens(),
    );
  }
}
