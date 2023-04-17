import 'package:fittrack/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WeekTotalWorkoutsCompleted extends StatefulWidget {
  const WeekTotalWorkoutsCompleted({super.key});

  @override
  State<WeekTotalWorkoutsCompleted> createState() =>
      _WeekTotalWorkoutsCompletedState();
}

class _WeekTotalWorkoutsCompletedState
    extends State<WeekTotalWorkoutsCompleted> {
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
        final startOfWeek =
            DateTime(today.year, today.month, today.day - (today.weekday));
        final endOfWeek = startOfWeek.add(const Duration(days: 6));

        final thisWeeksWorkouts = snapshot.data?.where((workout) {
          final dateTime = (workout['dateTime'] as Timestamp).toDate();
          return dateTime
                  .isAfter(startOfWeek.subtract(const Duration(seconds: 1))) &&
              dateTime.isBefore(endOfWeek.add(const Duration(days: 1)));
        }).toList();

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
                '${thisWeeksWorkouts?.length ?? 0}',
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
                    "Workouts Completed",
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
