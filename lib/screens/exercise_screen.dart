import 'package:fittrack/models/exercises.dart';
import 'package:fittrack/screens/finished_workout_screen.dart';
import 'package:fittrack/utils/theme_colors.dart';
import 'package:fittrack/widgets/timer_widget.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ExcerciseScreen extends StatefulWidget {
  final List<Exercise> exerciseScreenBuilds;
  const ExcerciseScreen({super.key, required this.exerciseScreenBuilds});

  @override
  State<ExcerciseScreen> createState() => _ExcerciseScreenState();
}

class _ExcerciseScreenState extends State<ExcerciseScreen> {
  final List<Duration> _pageDurations = List.filled(5, Duration.zero);
  int currentExercisePageIndex = 0;
  late PageController _pageController;
  late YoutubePlayerController _ytController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _ytController = YoutubePlayerController(
        initialVideoId:
            widget.exerciseScreenBuilds[currentExercisePageIndex].videoUrl,
        flags: const YoutubePlayerFlags(
            autoPlay: false, mute: false, isLive: false));
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentExercisePageIndex = _pageController.page?.round() ?? 0;
        _ytController = YoutubePlayerController(
          initialVideoId:
              widget.exerciseScreenBuilds[currentExercisePageIndex].videoUrl,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
            mute: false,
            isLive: false,
          ),
        );
      });
    });
  }

  @override
  void deactivate() {
    _ytController.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _ytController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exerciseScreenBuilds[currentExercisePageIndex].bodyPartFocus),
        backgroundColor: CustomColors.appBarColor,
        elevation: 0,
        ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: widget.exerciseScreenBuilds.length,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (int index) {
          setState(() {
            currentExercisePageIndex = index;
          });
        },
        itemBuilder: (_, i) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TimerWidget(
                        onDurationUpdated: (duration) {
                          _pageDurations[currentExercisePageIndex] = duration;
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 180,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: YoutubePlayer(
                        controller: _ytController,
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.blueAccent,
                        onReady: () => debugPrint("Ready"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        widget.exerciseScreenBuilds[i].name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(widget.exerciseScreenBuilds[i].exerciseClass),
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
                      Text(widget.exerciseScreenBuilds[i].exerciseCalories
                          .toString()),
                      const SizedBox(
                        width: 4,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        "Sets & Reps",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(widget.exerciseScreenBuilds[i].sets.toString()),
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
                      const Icon(LineIcons.alternateRedo),
                      const SizedBox(width: 4),
                      Text(widget.exerciseScreenBuilds[i].reps.toString())
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        "Body Focus",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Icon(LineIcons.thumbtack),
                      const SizedBox(width: 4),
                      Text(widget.exerciseScreenBuilds[i].bodyPartFocus),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.exerciseScreenBuilds[i].description,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: const [
                      Text(
                        "Equipment",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(LineIcons.dumbbell),
                      const SizedBox(width: 4),
                      Text(
                        widget.exerciseScreenBuilds[i].equipment,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: const [
                      Text(
                        "Recommended Set rest time",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(LineIcons.clock),
                      Text(
                        widget.exerciseScreenBuilds[i].setsRestTime,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  ElevatedButton(
                    onPressed: () {
                      int workoutCaloriesBurnt = 0;
                      // ignore: avoid_function_literals_in_foreach_calls
                      widget.exerciseScreenBuilds.forEach((exercise) {
                        workoutCaloriesBurnt += exercise.exerciseCalories;
                      });
                      if (currentExercisePageIndex ==
                          widget.exerciseScreenBuilds.length - 1) {
                        final totalDuration = _pageDurations.fold(
                          Duration.zero,
                          (previousValue, element) => previousValue + element,
                        );
    
                        final formattedDuration =
                            '${totalDuration.inHours}:${(totalDuration.inMinutes % 60).toString().padLeft(2, '0')}:${(totalDuration.inSeconds % 60).toString().padLeft(2, '0')}';
    
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FinishedWorkoutScreen(
                              totalCaloriesBurnt:
                                  workoutCaloriesBurnt,
                              workoutDuration: formattedDuration.toString(),
                            ),
                          ),
                        );
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(microseconds: 400),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.buttonColor,
                      fixedSize: const Size(315, 60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    child: Text(currentExercisePageIndex ==
                            widget.exerciseScreenBuilds.length - 1
                        ? "Finish Workout"
                        : "Next Exercise"),
                  ),
                  const SizedBox(height: 15),
                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
