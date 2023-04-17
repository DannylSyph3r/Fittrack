import 'package:fittrack/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MonthTotalCaloriesBurnt extends StatefulWidget {
  const MonthTotalCaloriesBurnt({super.key});

  @override
  State<MonthTotalCaloriesBurnt> createState() =>
      _MonthTotalCaloriesBurntState();
}

class _MonthTotalCaloriesBurntState extends State<MonthTotalCaloriesBurnt> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('workoutActivityData')
          .where('email_address',
              isEqualTo: FirebaseAuth.instance.currentUser?.email)
          .snapshots()
          .map((querySnapshot) {
        List<Map<String, dynamic>> completedWorkouts = [];
        for (var doc in querySnapshot.docs) {
          if (doc['isWorkoutCompleted'] == true) {
            completedWorkouts.add({
              'dateTime': doc['dateTime'],
              'totalCaloriesBurnt': doc['totalCaloriesBurnt'],
              'workoutDuration': doc['workoutDuration'],
            });
          }
        }
        return completedWorkouts;
      }),
      builder: (BuildContext context,
          AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: CustomColors.settingsCardColor,
            ),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error: ${snapshot.error.toString()}'),
              ),
            );
          });
          return Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: CustomColors.settingsCardColor,
            ),
            child: const Center(
              child: Icon(Icons.error),
            ),
          );
        }

        final today = DateTime.now();
        final startOfMonth = DateTime(today.year, today.month, 1);
        final endOfMonth = DateTime(today.year, today.month + 1, 0, 23, 59, 59);

        final monthWorkouts = snapshot.data?.where((workout) {
          final dateTime = (workout['dateTime'] as Timestamp).toDate();
          return dateTime.isAfter(startOfMonth) &&
              dateTime.isBefore(endOfMonth);
        }).toList();

        double totalCaloriesBurnt = 0;
        if (monthWorkouts != null) {
          for (var workout in monthWorkouts) {
            totalCaloriesBurnt += workout['totalCaloriesBurnt'];
          }
        }
        final totalCaloriesBurntInt = totalCaloriesBurnt.toInt();

        return Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: CustomColors.settingsCardColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$totalCaloriesBurntInt',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Kcals Burnt",
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
