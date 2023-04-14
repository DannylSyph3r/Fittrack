import 'dart:math';

import 'package:fittrack/models/exercises.dart';

List<Exercise> selectExercises(List<Exercise> allExercises, String bodyPartFocus, String exerciseClass, bool equipment) {
  List<Exercise> filteredExercises = allExercises.where((exercise) => 
      exercise.bodyPartFocus == bodyPartFocus && 
      exercise.exerciseClass == exerciseClass &&
      exercise.equipmentUse == equipment
  ).toList();

  List<Exercise> selectedExercises = [];

  if (filteredExercises.length >= 5) {
    selectedExercises = filteredExercises..shuffle();
    selectedExercises = selectedExercises.sublist(0, 5);
  } else {
    selectedExercises.addAll(filteredExercises);

    List<Exercise> remainingExercises = allExercises.where((exercise) => !filteredExercises.contains(exercise)).toList();

    if (remainingExercises.length >= (5 - filteredExercises.length)) {
      remainingExercises.shuffle();
      selectedExercises.addAll(remainingExercises.sublist(0, 5 - filteredExercises.length));
    } else {
      selectedExercises.addAll(remainingExercises);
      int remainingCount = 5 - selectedExercises.length;

      for (int i = 0; i < remainingCount; i++) {
        selectedExercises.add(allExercises[Random().nextInt(allExercises.length)]);
      }
    }
  }

  return selectedExercises;
}
