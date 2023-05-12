import 'package:firebase_auth/firebase_auth.dart';
import 'package:fittrack/widgets/activity_date_range_widget.dart';
import 'package:fittrack/widgets/month_total_calories.dart';
import 'package:fittrack/widgets/month_total_workout_duration.dart';
import 'package:fittrack/widgets/month_total_workouts.dart';
import 'package:fittrack/widgets/today_total_calories.dart';
import 'package:fittrack/widgets/today_total_workout.dart';
import 'package:fittrack/widgets/today_total_workout_duration.dart';
import 'package:fittrack/widgets/week_total_calories.dart';
import 'package:fittrack/widgets/week_total_workout_duration.dart';
import 'package:fittrack/widgets/week_total_workouts.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class ActivityTrackerScreen extends StatefulWidget {
  const ActivityTrackerScreen({super.key});

  @override
  State<ActivityTrackerScreen> createState() => _ActivityTrackerScreenState();
}

class _ActivityTrackerScreenState extends State<ActivityTrackerScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Activity Tracker",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    Icon(LineIcons.medal),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "Today",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        SizedBox(width: 5,),
                        TodayTotalWorkoutsStream(),
                        SizedBox(
                          width: 15,
                        ),
                        TodayTotalCaloriesBurnt(),
                        SizedBox(
                          width: 15,
                        ),
                        TodayTotalWorkoutDuration(),
                        SizedBox(width: 5,),
                      ]),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: const [
                    Icon(LineIcons.medal),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "This week",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        SizedBox(width: 5,),
                        WeekTotalWorkoutsCompleted(),
                        SizedBox(
                          width: 15,
                        ),
                        WeekTotalCaloriesBurnt(),
                        SizedBox(
                          width: 15,
                        ),
                        WeekTotalWorkoutDuration(),
                        SizedBox(width: 5,),
                      ]),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: const [
                    Icon(LineIcons.medal),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "This month",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 30,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        SizedBox(width: 5,),
                        MonthTotalWorkoutCompeted(),
                        SizedBox(
                          width: 15,
                        ),
                        MonthTotalCaloriesBurnt(),
                        SizedBox(
                          width: 15,
                        ),
                        MonthTotalWorkoutDuration(),
                        SizedBox(width: 5,),
                      ]),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: const [
                    Icon(LineIcons.calendar),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "Search",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                const ActivityDateRangeWidget(),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(height: 20,)
              ],
            ),
          ),
        ),
      )),
    );
  }
}
