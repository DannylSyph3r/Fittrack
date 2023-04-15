// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fittrack/utils/theme_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:line_icons/line_icons.dart';

// class ActivityTrackerScreen extends StatefulWidget {
//   const ActivityTrackerScreen({super.key});

//   @override
//   State<ActivityTrackerScreen> createState() => _ActivityTrackerScreenState();
// }

// class _ActivityTrackerScreenState extends State<ActivityTrackerScreen> {
//   final user = FirebaseAuth.instance.currentUser!;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: SingleChildScrollView(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 const Text(
//                   "Activity Tracker",
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   children: const [
//                     Icon(LineIcons.medal),
//                     SizedBox(
//                       width: 4,
//                     ),
//                     Text(
//                       "Today",
//                       style:
//                           TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         StreamBuilder<QuerySnapshot>(
//                           stream: FirebaseFirestore.instance
//                               .collection('workoutActivityData')
//                               .doc(FirebaseAuth.instance.currentUser?.email)
//                               .collection('workouts')
//                               .where('isWorkoutCompleted', isEqualTo: true)
//                               .snapshots(),
//                           builder: (BuildContext context,
//                               AsyncSnapshot<QuerySnapshot> snapshot) {
//                             if (snapshot.connectionState ==
//                                 ConnectionState.waiting) {
//                               return Container(
//                                 height: 90,
//                                 width: 90,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(15),
//                                   color: CustomColors.settingsCardColor,
//                                 ),
//                                 child: const Center(
//                                   child: CircularProgressIndicator(),
//                                 ),
//                               );
//                             }

//                             if (snapshot.hasError) {
//                               WidgetsBinding.instance.addPostFrameCallback((_) {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   SnackBar(
//                                     content: Text(
//                                         'Error: ${snapshot.error.toString()}'),
//                                   ),
//                                 );
//                               });
//                               return Container(
//                                 height: 90,
//                                 width: 90,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(15),
//                                   color: CustomColors.settingsCardColor,
//                                 ),
//                                 child: const Center(
//                                   child: Icon(Icons.error),
//                                 ),
//                               );
//                             }

//                             final completedWorkouts = snapshot.data?.docs ?? [];
//                             print('completedWorkouts.length: ${completedWorkouts.length}');

//                             final today = DateTime.now();
//                             final startOfToday =
//                                 DateTime(today.year, today.month, today.day);
//                             final endOfToday = DateTime(
//                                 today.year, today.month, today.day, 23, 59, 59);

//                             print('User email: ${FirebaseAuth.instance.currentUser?.email}');
//                             print('Today: $today');
//                             print('Start of today: $startOfToday');
//                             print('End of today: $endOfToday');
//                             final todayWorkouts =
//                                 completedWorkouts.where((workout) {
//                               final dateTime =
//                                   (workout['dateTime'] as Timestamp).toDate();
//                               print(
//                                   'dateTime: $dateTime, isWorkoutCompleted: ${workout['isWorkoutCompleted']}');
//                               return workout['isWorkoutCompleted'] &&
//                                   dateTime.isAfter(startOfToday) &&
//                                   dateTime.isBefore(endOfToday);
//                             }).toList();

//                             print(
//                                 'todayWorkouts.length: ${todayWorkouts.length}');

//                             return Container(
//                               height: 90,
//                               width: 90,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(15),
//                                 color: CustomColors.settingsCardColor,
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   '${todayWorkouts.length}',
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 24,
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                         const SizedBox(
//                           width: 15,
//                         ),
//                         Column(
//                           children: [
//                             Container(
//                               height: 90,
//                               width: 90,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(15),
//                                   color: CustomColors.settingsCardColor),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           width: 15,
//                         ),
//                         Column(
//                           children: [
//                             Container(
//                               height: 90,
//                               width: 90,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(15),
//                                   color: CustomColors.settingsCardColor),
//                             ),
//                           ],
//                         ),
//                       ]),
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 Row(
//                   children: const [
//                     Icon(LineIcons.medal),
//                     SizedBox(
//                       width: 4,
//                     ),
//                     Text(
//                       "This week",
//                       style:
//                           TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 Row(
//                   children: const [
//                     Icon(LineIcons.medal),
//                     SizedBox(
//                       width: 4,
//                     ),
//                     Text(
//                       "This month",
//                       style:
//                           TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 Row(
//                   children: const [
//                     Icon(LineIcons.search),
//                     SizedBox(
//                       width: 4,
//                     ),
//                     Text(
//                       "Search",
//                       style:
//                           TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Column(
//                           children: [
//                             Container(
//                               height: 90,
//                               width: 90,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(15),
//                                   color: CustomColors.settingsCardColor),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           width: 15,
//                         ),
//                         Column(
//                           children: [
//                             Container(
//                               height: 90,
//                               width: 90,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(15),
//                                   color: CustomColors.settingsCardColor),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           width: 15,
//                         ),
//                         Column(
//                           children: [
//                             Container(
//                               height: 90,
//                               width: 90,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(15),
//                                   color: CustomColors.settingsCardColor),
//                             ),
//                           ],
//                         ),
//                       ]),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       )),
//     );
//   }
// }
