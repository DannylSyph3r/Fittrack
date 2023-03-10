import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fittrack/auth/auth_page.dart';
import 'package:fittrack/screens/complete_profile_screen.dart';
import 'package:fittrack/screens/loading_screen.dart';
import 'package:flutter/material.dart';

import 'home_screen_fittrack.dart';

class InitializedScreen extends StatelessWidget {
  const InitializedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              final User? user = snapshot.data;

              if (user == null) {
                // User is not authenticated, show AuthPage
                return const AuthPage();
              } else {
                // Check if user's profile is complete
                final userDoc = FirebaseFirestore.instance
                    .collection('fittrackUsers')
                    .where('email', isEqualTo: user.email)
                    .limit(1);
                return StreamBuilder<QuerySnapshot>(
                  stream: userDoc.snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      final data = snapshot.data?.docs.first.data()
                          as Map<String, dynamic>?;
                      final isProfileComplete =
                          data?['isProfileComplete'] ?? false;
                      final firstName = data?['firstName'] ?? '';

                      if (isProfileComplete) {
                        // User's profile is complete, show MainHomeScreen
                        return MainHomeScreen(firstName: firstName);
                      } else {
                        // User's profile is not complete, show CompleteUserProfileScreen
                        return const CompleteUserProfileScreen();
                      }
                    } else {
                      // Still loading profile data, show loading indicator
                      return Scaffold(
                        body: Center(
                          child: LoadingScreen(),
                        ),
                      );
                    }
                  },
                );
              }
            } else {
              // Still loading authentication state, show loading indicator
              return Scaffold(
                body: Center(
                  child: LoadingScreen(),
                ),
              );
            }
          }),
    );
  }
}
