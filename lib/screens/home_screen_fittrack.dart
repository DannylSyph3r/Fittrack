import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fittrack/models/workouts.dart';
import 'package:fittrack/screens/workout_screen.dart';
import 'package:fittrack/utils/select_exercises.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:fittrack/models/exercises.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ListView(
              children: [
                Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Welcome Back,",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 5),
                              StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection('fittrackUsers')
                                    .where('email',
                                        isEqualTo: FirebaseAuth
                                            .instance.currentUser?.email)
                                    .snapshots(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (snapshot.hasData) {
                                    final DocumentSnapshot userDoc =
                                        snapshot.data!.docs.first;
                                    final String firstName =
                                        userDoc['firstname'];
                                    final String lastName = userDoc['lastname'];
                                    return Text(
                                      "$firstName $lastName",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    );
                                  } else {
                                    return const SizedBox();
                                  }
                                },
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.grey.shade300),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(LineIcons.bell)),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(
                            "FitTrack Workouts",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      ListView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: allWorkouts.length,
                        itemBuilder: (context, index) {
                          WorkoutSelection fullWorkoutScreenExercises =
                              allWorkouts[index];
                          return Column(
                            children: [
                              const SizedBox(
                                height: 25,
                              ),
                              Container(
                                height: 265,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: const LinearGradient(
                                      colors: [
                                        Colors.blue,
                                        Colors.purple,
                                        Colors.deepPurple
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  fullWorkoutScreenExercises
                                                      .name,
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                const Icon(LineIcons.running),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  '${fullWorkoutScreenExercises.numExercises.toString()} Exercises',
                                                  style:
                                                      const TextStyle(fontSize: 13),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                const Icon(LineIcons.clock),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  fullWorkoutScreenExercises
                                                      .timeRange,
                                                  style:
                                                      const TextStyle(fontSize: 13),
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                const Icon(LineIcons.dumbbell),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                fullWorkoutScreenExercises
                                                            .equipmentRequired ==
                                                        true
                                                    ? const Text(
                                                        'Equipment needed',
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )
                                                    : const Text(
                                                        'No equipment required',
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                    height: 35,
                                                    width: 170,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        color: Colors.white60),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10.0),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                fullWorkoutScreenExercises
                                                                    .workoutClass,
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                  width: 4),
                                                              if (fullWorkoutScreenExercises
                                                                      .workoutClass ==
                                                                  "Beginner")
                                                                const Icon(
                                                                  LineIcons
                                                                      .lightningBolt,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          255,
                                                                          230,
                                                                          0),
                                                                )
                                                              else if (fullWorkoutScreenExercises
                                                                      .workoutClass ==
                                                                  "Intermediate")
                                                                Row(
                                                                  children: const [
                                                                    Icon(
                                                                      LineIcons
                                                                          .lightningBolt,
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          255,
                                                                          230,
                                                                          0),
                                                                    ),
                                                                    Icon(
                                                                      LineIcons
                                                                          .lightningBolt,
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          255,
                                                                          230,
                                                                          0),
                                                                    ),
                                                                  ],
                                                                )
                                                              else if (fullWorkoutScreenExercises
                                                                      .workoutClass ==
                                                                  "Advanced")
                                                                Row(
                                                                  children: const [
                                                                    Icon(
                                                                      LineIcons
                                                                          .lightningBolt,
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          255,
                                                                          230,
                                                                          0),
                                                                    ),
                                                                    Icon(
                                                                      LineIcons
                                                                          .lightningBolt,
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          255,
                                                                          230,
                                                                          0),
                                                                    ),
                                                                    Icon(
                                                                      LineIcons
                                                                          .lightningBolt,
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          255,
                                                                          230,
                                                                          0),
                                                                    ),
                                                                  ],
                                                                ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    )),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                ElevatedButton(
                                                    onPressed: () {
                                                      List<Exercise>
                                                          selectedExercises =
                                                          selectExercises(
                                                              exercisesList,
                                                              'Arms Workout',
                                                              'Beginner',
                                                              false);
                                                      int totalCalories = 0;
                                                      for (var exercise in selectedExercises) {
                                                        totalCalories += exercise
                                                            .exerciseCalories;
                                                      }
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) => WorkoutScreen(
                                                                  workoutName:
                                                                      fullWorkoutScreenExercises
                                                                          .name,
                                                                  totalEstimatedCalories:
                                                                      totalCalories,
                                                                  workoutClass:
                                                                      fullWorkoutScreenExercises
                                                                          .workoutClass,
                                                                  estimatedTime:
                                                                      fullWorkoutScreenExercises
                                                                          .timeRange,
                                                                  workoutScreenExercise:
                                                                      selectedExercises)));
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                        fixedSize:
                                                            const Size(170, 32),
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20))),
                                                    child:
                                                        const Text("Start Workout"))
                                              ],
                                            )
                                          ]),
                                      const SizedBox(
                                        width: 40,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              CircleAvatar(
                                                radius: 15,
                                                backgroundColor: Colors.blue,
                                                backgroundImage: AssetImage(
                                                    "assets/images/${fullWorkoutScreenExercises.avatarImage}",),
                                                child: const Text(''),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
