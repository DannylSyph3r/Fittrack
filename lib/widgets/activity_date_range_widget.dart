import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fittrack/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class ActivityDateRangeWidget extends StatefulWidget {
  const ActivityDateRangeWidget({Key? key}) : super(key: key);

  @override
  State<ActivityDateRangeWidget> createState() =>
      _ActivityDateRangeWidgetState();
}

class _ActivityDateRangeWidgetState extends State<ActivityDateRangeWidget> {
  DateTimeRange dateRange =
      DateTimeRange(start: DateTime(2023, 1, 1), end: DateTime(2023, 5, 31));

  Future<void> pickDateRange() async {
    final initialDateRange = dateRange;
    final newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2023),
      lastDate: DateTime(2024),
      initialDateRange: initialDateRange,
      helpText: 'Select the Date range',
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            colorScheme: const ColorScheme.light(
              primary: Color.fromARGB(
                  255, 31, 42, 99), // set your desired color here
            ),
          ),
          child: child!,
        );
      },
    );
    if (newDateRange != null) {
      setState(() {
        dateRange = newDateRange;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final startDate = dateRange.start;
    final endDate = dateRange.end;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () async {
                await pickDateRange();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                fixedSize: const Size(150, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: const BorderSide(
                    width: 2.5,
                    color: Color.fromARGB(255, 31, 42, 99),
                  ), // Set the outline color here
                ),
              ),
              child: Row(
                children: [
                  Text(
                    formatDate(startDate, [yyyy, '/', mm, '/', dd]),
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    LineIcons.angleDown,
                    color: Colors.black,
                    size: 15,
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            ElevatedButton(
              onPressed: () async {
                await pickDateRange();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                fixedSize: const Size(150, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: const BorderSide(
                    width: 2.5,
                    color: Color.fromARGB(255, 31, 42, 99),
                  ), // Set the outline color here
                ),
              ),
              child: Row(
                children: [
                  Text(
                    formatDate(endDate, [yyyy, '/', mm, '/', dd]),
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    LineIcons.angleDown,
                    color: Colors.black,
                    size: 15,
                  )
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            const SizedBox(
              width: 5,
            ),
            StreamBuilder<List<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('workoutActivityData')
                  .where('email_address',
                      isEqualTo: FirebaseAuth.instance.currentUser?.email)
                  .snapshots()
                  .map((querySnapshot) {
                List<Map<String, dynamic>> completedWorkouts = [];
                for (var doc in querySnapshot.docs) {
                  if (doc['isWorkoutCompleted'] == true) {
                    final dateTime =
                        (doc['dateTime'] as Timestamp).toDate().toString();
                    completedWorkouts.add({
                      'dateTime': dateTime,
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
    
                // Filter the completed workouts by the selected date range
                List<Map<String, dynamic>> filteredWorkouts = [];
                for (var workout in snapshot.data!) {
                  DateTime workoutDate = DateTime.parse(workout['dateTime']);
                  if (workoutDate.isAfter(dateRange.start) &&
                      workoutDate.isBefore(dateRange.end
                          .add(const Duration(days: 1))
                          .subtract(const Duration(seconds: 1)))) {
                    filteredWorkouts.add(workout);
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
                        '${filteredWorkouts.length}',
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
                      isEqualTo: FirebaseAuth.instance.currentUser?.email)
                  .snapshots()
                  .map((querySnapshot) {
                List<Map<String, dynamic>> completedWorkouts = [];
                for (var doc in querySnapshot.docs) {
                  if (doc['isWorkoutCompleted'] == true) {
                    final dateTime =
                        (doc['dateTime'] as Timestamp).toDate().toString();
                    completedWorkouts.add({
                      'dateTime': dateTime,
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
    
                // Filter the completed workouts by the selected date range
                List<Map<String, dynamic>> filteredWorkouts = [];
                for (var workout in snapshot.data!) {
                  DateTime workoutDate = DateTime.parse(workout['dateTime']);
                  if (workoutDate.isAfter(dateRange.start) &&
                      workoutDate.isBefore(dateRange.end
                          .add(const Duration(days: 1))
                          .subtract(const Duration(seconds: 1)))) {
                    filteredWorkouts.add(workout);
                  }
                }
    
                num totalCaloriesBurnt = 0;
                for (var workout in filteredWorkouts) {
                  totalCaloriesBurnt += workout['totalCaloriesBurnt'];
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
                        '$totalCaloriesBurnt',
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
                      isEqualTo: FirebaseAuth.instance.currentUser?.email)
                  .snapshots()
                  .map((querySnapshot) {
                List<Map<String, dynamic>> completedWorkouts = [];
                for (var doc in querySnapshot.docs) {
                  if (doc['isWorkoutCompleted'] == true) {
                    final dateTime =
                        (doc['dateTime'] as Timestamp).toDate().toString();
                    completedWorkouts.add({
                      'dateTime': dateTime,
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
    
                // Filter the completed workouts by the selected date range
                List<Map<String, dynamic>> filteredWorkouts = [];
                for (var workout in snapshot.data!) {
                  DateTime workoutDate = DateTime.parse(workout['dateTime']);
                  if (workoutDate.isAfter(dateRange.start) &&
                      workoutDate.isBefore(dateRange.end
                          .add(const Duration(days: 1))
                          .subtract(const Duration(seconds: 1)))) {
                    filteredWorkouts.add(workout);
                  }
                }
    
                int totalDurationInMinutes = 0;
    
                for (var workout in filteredWorkouts) {
                  final duration =
                      workout['workoutDuration'].toString().split(':');
                  final hoursInMinutes = int.parse(duration[0]) * 60;
                  final minutes = int.parse(duration[1]);
                  final durationInMinutes = hoursInMinutes + minutes;
                  totalDurationInMinutes += durationInMinutes;
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
            const SizedBox(
              width: 5,
            )
          ]),
        )
      ],
    );
  }
}
