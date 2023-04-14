import 'package:fittrack/models/exercises.dart';
import 'package:fittrack/screens/exercise_screen.dart';
import 'package:fittrack/utils/theme_colors.dart';
import 'package:fittrack/widgets/app_buttons.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class WorkoutScreen extends StatefulWidget {
  final String workoutName;
  final int totalEstimatedCalories;
  final String workoutClass;
  final String estimatedTime;
  final List<Exercise> workoutScreenExercise;
  const WorkoutScreen(
      {super.key,
      required this.workoutName,
      required this.totalEstimatedCalories,
      required this.workoutClass,
      required this.estimatedTime,
      required this.workoutScreenExercise});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: CustomColors.backgroundFillColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
              child: Image.asset("assets/images/workoutpage.png"),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(27),
                      topRight: Radius.circular(27))),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        // ignore: prefer_const_literals_to_create_immutables
                        Text(
                          widget.workoutName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text("5 Exercises"),
                        const SizedBox(
                          width: 4,
                        ),
                        const Text(
                          "|",
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Icon(LineIcons.fire),
                        const SizedBox(width: 4),
                        Text("${widget.totalEstimatedCalories} total Kcals"),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Container(
                            height: 35,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white60),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.workoutClass,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                            height: 35,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white60),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const Icon(LineIcons.clockAlt),
                                const SizedBox(width: 4),
                                Text(widget.estimatedTime),
                              ],
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: const [
                        // ignore: prefer_const_literals_to_create_immutables
                        Text(
                          "You'll need..",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 130,
                            width: 130,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white54),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/mat.png",
                                    height: 90,
                                    width: 80,
                                  ),
                                ]),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 130,
                            width: 130,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white54),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/barbel.png",
                                    height: 90,
                                    width: 80,
                                  ),
                                ]),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 130,
                            width: 130,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white54),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/water-bottle.png",
                                    height: 90,
                                    width: 80,
                                  ),
                                ]),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: const [
                        // ignore: prefer_const_literals_to_create_immutables
                        Text(
                          "Exercises",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: widget.workoutScreenExercise.length,
                      itemBuilder: (context, index) {
                        Exercise workoutScreenExercises =
                            widget.workoutScreenExercise[index];
                        return Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  Container(
                                    height: 90,
                                    width: 90,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            // ignore: prefer_const_literals_to_create_immutables
                                            children: [
                                              const Icon(
                                                LineIcons.running,
                                                size: 32,
                                              ),
                                              const SizedBox(
                                                width: 4,
                                              ),
                                              const Text(
                                                "|",
                                                style: TextStyle(fontSize: 25),
                                              ),
                                              const SizedBox(
                                                width: 4,
                                              ),
                                              const Icon(
                                                LineIcons.dumbbell,
                                                size: 28,
                                              )
                                            ],
                                          )
                                        ]),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  workoutScreenExercises.name,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                        'Sets: ${workoutScreenExercises.sets}'),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    const Text(
                                      "|",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                        'Reps: ${workoutScreenExercises.reps}'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(LineIcons.clock),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                        'Rest Interval: ${workoutScreenExercises.setsRestTime}'),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                )
                              ],
                            )
                          ],
                        );
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    AppButtons(
                        onButtonPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ExcerciseScreen(
                                      exerciseScreenBuilds:
                                          widget.workoutScreenExercise)));
                        },
                        buttonPlaceholderText: "Start Workout"),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
