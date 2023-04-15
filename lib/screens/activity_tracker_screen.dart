import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fittrack/utils/theme_colors.dart';
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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                      children: [
                        StreamBuilder<List<Map<String, dynamic>>>(
                          stream: FirebaseFirestore.instance
                              .collection('workoutActivityData')
                              .where('email_address',
                                  isEqualTo:
                                      FirebaseAuth.instance.currentUser?.email)
                              .snapshots()
                              .map((querySnapshot) {
                            List<Map<String, dynamic>> completedWorkouts = [];
                            for (var doc in querySnapshot.docs) {
                              if (doc['isWorkoutCompleted'] == true) {
                                completedWorkouts.add({
                                  'dateTime': doc['dateTime'],
                                  'totalCaloriesBurnt':
                                      doc['totalCaloriesBurnt'],
                                  'workoutDuration': doc['workoutDuration'],
                                });
                              }
                            }
                            return completedWorkouts;
                          }),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<Map<String, dynamic>>>
                                  snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
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
                                    content: Text(
                                        'Error: ${snapshot.error.toString()}'),
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
                            final startOfToday =
                                DateTime(today.year, today.month, today.day);
                            final endOfToday = DateTime(
                                today.year, today.month, today.day, 23, 59, 59);

                            final todayWorkouts =
                                snapshot.data?.where((workout) {
                              final dateTime =
                                  (workout['dateTime'] as Timestamp).toDate();
                              return dateTime.isAfter(startOfToday) &&
                                  dateTime.isBefore(endOfToday);
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
                                    '${todayWorkouts?.length ?? 0}',
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
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        StreamBuilder<List<Map<String, dynamic>>>(
                          stream: FirebaseFirestore.instance
                              .collection('workoutActivityData')
                              .where('email_address',
                                  isEqualTo:
                                      FirebaseAuth.instance.currentUser?.email)
                              .snapshots()
                              .map((querySnapshot) {
                            List<Map<String, dynamic>> completedWorkouts = [];
                            for (var doc in querySnapshot.docs) {
                              if (doc['isWorkoutCompleted'] == true) {
                                completedWorkouts.add({
                                  'dateTime': doc['dateTime'],
                                  'totalCaloriesBurnt':
                                      doc['totalCaloriesBurnt'],
                                  'workoutDuration': doc['workoutDuration'],
                                });
                              }
                            }
                            return completedWorkouts;
                          }),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<Map<String, dynamic>>>
                                  snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
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
                                    content: Text(
                                        'Error: ${snapshot.error.toString()}'),
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
                            final startOfToday =
                                DateTime(today.year, today.month, today.day);
                            final endOfToday = DateTime(
                                today.year, today.month, today.day, 23, 59, 59);

                            final todayWorkouts =
                                snapshot.data?.where((workout) {
                              final dateTime =
                                  (workout['dateTime'] as Timestamp).toDate();
                              return dateTime.isAfter(startOfToday) &&
                                  dateTime.isBefore(endOfToday);
                            }).toList();

                            double totalCaloriesBurnt = 0;
                            if (todayWorkouts != null) {
                              for (var workout in todayWorkouts) {
                                totalCaloriesBurnt +=
                                    workout['totalCaloriesBurnt'];
                              }
                            }
                            final totalCaloriesBurntInt =
                                totalCaloriesBurnt.toInt();

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
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        StreamBuilder<List<Map<String, dynamic>>>(
                          stream: FirebaseFirestore.instance
                              .collection('workoutActivityData')
                              .where('email_address',
                                  isEqualTo:
                                      FirebaseAuth.instance.currentUser?.email)
                              .snapshots()
                              .map((querySnapshot) {
                            List<Map<String, dynamic>> completedWorkouts = [];
                            for (var doc in querySnapshot.docs) {
                              if (doc['isWorkoutCompleted'] == true) {
                                completedWorkouts.add({
                                  'dateTime': doc['dateTime'],
                                  'totalCaloriesBurnt':
                                      doc['totalCaloriesBurnt'],
                                  'workoutDuration': doc['workoutDuration'],
                                });
                              }
                            }
                            return completedWorkouts;
                          }),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<Map<String, dynamic>>>
                                  snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
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
                                    content: Text(
                                        'Error: ${snapshot.error.toString()}'),
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
                            final startOfToday =
                                DateTime(today.year, today.month, today.day);
                            final endOfToday = DateTime(
                                today.year, today.month, today.day, 23, 59, 59);

                            final todayWorkouts =
                                snapshot.data?.where((workout) {
                              final dateTime =
                                  (workout['dateTime'] as Timestamp).toDate();
                              return dateTime.isAfter(startOfToday) &&
                                  dateTime.isBefore(endOfToday);
                            }).toList();

                            int totalDurationInMinutes = 0;

                            if (todayWorkouts != null) {
                              for (var workout in todayWorkouts) {
                                final duration = workout['workoutDuration']
                                    .toString()
                                    .split(':');
                                final hoursInMinutes =
                                    int.parse(duration[0]) * 60;
                                final minutes = int.parse(duration[1]);
                                final durationInMinutes =
                                    hoursInMinutes + minutes;
                                totalDurationInMinutes += durationInMinutes;
                              }
                            }

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
                                    '$totalDurationInMinutes',
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
                                        "Minutes",
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        ),
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
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: const [
                    Icon(LineIcons.search),
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
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: CustomColors.settingsCardColor),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          children: [
                            Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: CustomColors.settingsCardColor),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          children: [
                            Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: CustomColors.settingsCardColor),
                            ),
                          ],
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
