import 'package:fittrack/utils/theme_colors.dart';
import 'package:flutter/material.dart';

class AboutFittrackScreen extends StatelessWidget {
  const AboutFittrackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.appBarColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: const [
                  SizedBox(
                  height: 20,
                ),
                Text(
                  "About Fittrack Fitness",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Welcome to Fittrack, a mobile fitness application developed in 2023! Our app is designed to help fitness enthusiasts monitor and track their workout progress, while also providing personalized workout plans to help them reach their goals. Fittrack was developed with the feedback and requirements of both fitness enthusiasts and experts, using a mixed-methods approach that combined both qualitative and quantitative research methods. The result is an app that is tailored to meet the needs of its users, with features and functionalities executed using a user-friendly interface to provide users with a splendid experience while providing great performance. We understand that maintaining motivation and monitoring progress during workouts can be a challenge for some individuals. That's why Fittrack aims to be the ideal tool for assisting individuals in their fitness journey. With our app, users will be able to compare their weekly results and be motivated to improve by evaluating their activity level and weight. They also have the option of personally choosing their fitness routines, which makes being active and leading a healthy lifestyle pleasurable. Our ultimate goal is to help users achieve their fitness objectives and maintain a healthy lifestyle. We hope that Fittrack will be put to good use by serving its intended purpose and empowering users to take control of their health and fitness.", textAlign: TextAlign.justify,),
                SizedBox(height: 10,),
                Text("Thank you for choosing Fittrack, and we look forward to helping you on your fitness journey.", textAlign: TextAlign.justify,),
                SizedBox(
                  height: 20,
                ),
                ],),
            ),
          ) ),
       ),
    );
  }
}