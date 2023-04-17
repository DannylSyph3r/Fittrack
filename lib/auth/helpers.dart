import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final uid = FirebaseAuth.instance.currentUser?.uid;

  Future userSignIn(email, password, context) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      error(context, e.message);
    }
  }

  Future<void> userRegistrationSequence(
      email, password, firstname, lastname, context) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await FirebaseFirestore.instance
          .collection('fittrackUsers')
          .doc(uid)
          .set({
        'firstname': firstname,
        'lastname': lastname,
        'email': email,
        'date_created': DateTime.now()
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User registered successfully'),
        ),
      );
    } on FirebaseAuthException catch (e) {
      error(context, e.message);
    }
  }

  Future addCompleteProfileDetails(
      email, gender, dateOfBirth, height, weight, programGoal, context) async {
    try {
      final userRef = FirebaseFirestore.instance
          .collection('fittrackUsers')
          .where('email', isEqualTo: email)
          .limit(1);

      await userRef.get().then((querySnapshot) {
        final userDoc = querySnapshot.docs.first;
        userDoc.reference.update({
          'gender': gender,
          'dob': dateOfBirth,
          'height': height,
          'weight': weight,
          'goal': programGoal,
          'isProfileComplete': true
        });
      });
    } on FirebaseException catch (e) {
      error(context, e.message);
    }
  }

  Future userPasswordReset(email, context) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text("Reset Password"),
              content: Text("Password reset link sent! Check your email.."),
            );
          });
    } on FirebaseAuthException catch (e) {
      error(context, e.message);
    }
  }

  Future<void> recordUserActivityDetails(BuildContext context, String email,
      workoutDuration, int totalCaloriesBurnt) async {
    try {
      await FirebaseFirestore.instance.collection('workoutActivityData').add({
        'email_address': email,
        'totalCaloriesBurnt': totalCaloriesBurnt,
        'workoutDuration': workoutDuration,
        'isWorkoutCompleted': true,
        'dateTime': Timestamp.fromDate(DateTime.now())
      });
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Workout data added')));
    } on FirebaseAuthException catch (e) {
      error(context, e.message);
    }
  }

  Future updateUserWeight(email, double weight, BuildContext context) async {
    try {
      // Get the Firestore document for the user with the given email address
      final userDoc = await FirebaseFirestore.instance
          .collection('fittrackUsers')
          .where('email', isEqualTo: email)
          .limit(1)
          .get();

      // Check if a matching user document was found
      if (userDoc.docs.isNotEmpty) {
        final userRef = userDoc.docs.first.reference;
        // Update the weight field of the user document
        await userRef.update({'weight': weight.toString()});

        // Show a success message to the user
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Weight updated Succesfully")),
        );
      } else {
        // If no matching user document was found, show an error message
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not find user with email $email')),
        );
      }
    } on FirebaseAuthException catch (e) {
      error(context, e.message);
    }
  }

  Future updateUserHeight(email, double height, BuildContext context) async {
    try {
      // Get the Firestore document for the user with the given email address
      final userDoc = await FirebaseFirestore.instance
          .collection('fittrackUsers')
          .where('email', isEqualTo: email)
          .limit(1)
          .get();

      // Check if a matching user document was found
      if (userDoc.docs.isNotEmpty) {
        final userRef = userDoc.docs.first.reference;
        // Update the weight field of the user document
        await userRef.update({'height': height.toString()});

        // Show a success message to the user
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Height updated Succesfully")),
        );
      } else {
        // If no matching user document was found, show an error message
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not find user with email $email')),
        );
      }
    } on FirebaseAuthException catch (e) {
      error(context, e.message);
    }
  }

  error(context, e) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Error"),
            content: Text(e.toString()),
          );
        });
  }
}
