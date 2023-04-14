import 'package:fittrack/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';


class ActivityTrackerScreen extends StatefulWidget {
  const ActivityTrackerScreen({super.key});

  @override
  State<ActivityTrackerScreen> createState() => _ActivityTrackerScreenState();
}

class _ActivityTrackerScreenState extends State<ActivityTrackerScreen> {
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
                const SizedBox(height: 20,),
                Text(
                  "Activity Tracker",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    const Icon(LineIcons.medal),
                    const SizedBox(width: 4,),
                    const Text("Today", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                  ],
                ),
                const SizedBox(height: 30,),
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
                      const SizedBox(width: 15,),
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
                      const SizedBox(width: 15,),
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
                const SizedBox(height: 30,),
                Row(
                  children: [
                    const Icon(LineIcons.medal),
                    const SizedBox(width: 4,),
                    const Text("This week", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                  ],
                ),
                const SizedBox(height: 30,),
                Row(
                  children: [
                    const Icon(LineIcons.medal),
                    const SizedBox(width: 4,),
                    const Text("This month", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                  ],
                ),
                const SizedBox(height: 30,),
                Row(
                  children: [
                    const Icon(LineIcons.search),
                    const SizedBox(width: 4,),
                    const Text("Search", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                  ],
                ),
                const SizedBox(height: 20,),
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
                      const SizedBox(width: 15,),
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
                      const SizedBox(width: 15,),
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
