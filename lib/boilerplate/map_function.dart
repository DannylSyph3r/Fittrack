// Future<void> recordUserActivityDetails(BuildContext context, String email,
//       workoutDuration, int totalCaloriesBurnt) async {
//     try {
//       // Get a reference to the Firebase collection
//       CollectionReference workoutCollection =
//           FirebaseFirestore.instance.collection('workoutActivityData');

//       // Generate a unique document ID for the workout
//       DocumentReference newWorkoutDoc = workoutCollection.doc();
//       String workoutDocId = newWorkoutDoc.id;

//       // Create a map with the workout data
//       Map<String, dynamic> workoutData = {
//         'workouts': {
//           workoutDocId: {
//             'totalCaloriesBurnt': totalCaloriesBurnt,
//             'workoutDuration': workoutDuration,
//             'isWorkoutCompleted': true,
//             'dateTime': Timestamp.fromDate(DateTime.now())
//           }
//         }
//       };

//       // Add the workout data to the collection using the user's email address as the document ID
//       await workoutCollection
//           .doc(email)
//           .set(workoutData, SetOptions(merge: true));

//       // ignore: use_build_context_synchronously
//       ScaffoldMessenger.of(context)
//           .showSnackBar(const SnackBar(content: Text('Workout data added')));
//     } on FirebaseAuthException catch (e) {
//       error(context, e.message);
//     }
//   }