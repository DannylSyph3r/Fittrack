import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fittrack/screens/complete_profile_screen.dart';
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
      });
      print('User registered successfully');
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
