class WorkoutSelection {
  final String name;
  final String timeRange;
  final String workoutClass;
  final int numExercises;
  final String avatarImage;
  late bool equipmentRequired;

  WorkoutSelection(
      {
      required this.avatarImage,
      required this.name,
      required this.workoutClass,
      required this.timeRange,
      this.numExercises = 5,
      required this.equipmentRequired});
}

List<WorkoutSelection> allWorkouts = [
  WorkoutSelection(
      avatarImage: "arms.jpg",
      name: "Arms Workout",
      workoutClass: "Beginner",
      timeRange: "15-30 Mins",
      equipmentRequired: false),
  WorkoutSelection(
      name: "Chest Workout",
      workoutClass: "Beginner",
      timeRange: "15-30 Mins",
      equipmentRequired: false,
      avatarImage: "chest.jpg"),
  WorkoutSelection(
      name: "Shoulder & Back Workout",
      workoutClass: "Beginner",
      timeRange: "15-30 Mins",
      equipmentRequired: false,
      avatarImage: "s_and_b.jpg"),
  WorkoutSelection(
      name: "Abs Workout",
      workoutClass: "Beginner",
      timeRange: "15-30 Mins",
      equipmentRequired: false,
      avatarImage: "abs.jpg"),
  WorkoutSelection(
      name: "Leg Workout",
      workoutClass: "Beginner",
      timeRange: "15-30 Mins",
      equipmentRequired: false,
      avatarImage: "leg.png"),
  WorkoutSelection(
      name: "Arms Workout",
      workoutClass: "Beginner",
      timeRange: "15-35 Mins",
      equipmentRequired: true,
      avatarImage: "arms.jpg"),
  WorkoutSelection(
      name: "Chest Workout",
      workoutClass: "Beginner",
      timeRange: "15-35 Mins",
      equipmentRequired: true,
      avatarImage: "chest.jpg"),
  WorkoutSelection(
      name: "Shoulder & Back Workout",
      workoutClass: "Beginner",
      timeRange: "15-35 Mins",
      equipmentRequired: true,
      avatarImage: "s_and_b.jpg"),
  WorkoutSelection(
      name: "Abs Workout",
      workoutClass: "Beginner",
      timeRange: "15-35 Mins",
      equipmentRequired: true,
      avatarImage: "abs.jpg"),
  WorkoutSelection(
      name: "Leg Workout",
      workoutClass: "Beginner",
      timeRange: "15-35 Mins",
      equipmentRequired: true,
      avatarImage: "leg.png"),
  WorkoutSelection(
      name: "Arms Workout",
      workoutClass: "Intermediate",
      timeRange: "25-40 Mins",
      equipmentRequired: false,
      avatarImage: "arms.jpg"),
  WorkoutSelection(
      name: "Chest Workout",
      workoutClass: "Intermediate",
      timeRange: "25-40 Mins",
      equipmentRequired: false,
      avatarImage: "chest.jpg"),
  WorkoutSelection(
      name: "Shoulder & Back Workout",
      workoutClass: "Intermediate",
      timeRange: "25-40 Mins",
      equipmentRequired: false,
      avatarImage: "s_and_b.jpg"),
  WorkoutSelection(
      name: "Abs Workout",
      workoutClass: "Intermediate",
      timeRange: "25-40 Mins",
      equipmentRequired: false,
      avatarImage: "abs.jpg"),
  WorkoutSelection(
      name: "Leg Workout",
      workoutClass: "Intermediate",
      timeRange: "25-40 Mins",
      equipmentRequired: false,
      avatarImage: "leg.png"),
  WorkoutSelection(
      name: "Arms Workout",
      workoutClass: "Intermediate",
      timeRange: "25-45 Mins",
      equipmentRequired: true,
      avatarImage: "arms.jpg"),
  WorkoutSelection(
      name: "Chest Workout",
      workoutClass: "Intermediate",
      timeRange: "25-45 Mins",
      equipmentRequired: true,
      avatarImage: "chest.jpg"),
  WorkoutSelection(
      name: "Shoulder & Back Workout",
      workoutClass: "Intermediate",
      timeRange: "25-45 Mins",
      equipmentRequired: true,
      avatarImage: "s_and_b.jpg"),
  WorkoutSelection(
      name: "Abs Workout",
      workoutClass: "Intermediate",
      timeRange: "25-45 Mins",
      equipmentRequired: true,
      avatarImage: "abs.jpg"),
  WorkoutSelection(
      name: "Leg Workout",
      workoutClass: "Intermediate",
      timeRange: "25-45 Mins",
      equipmentRequired: true,
      avatarImage: "leg.png"),
  WorkoutSelection(
      name: "Arms Workout",
      workoutClass: "Advanced",
      timeRange: "45-60 Mins",
      equipmentRequired: false,
      avatarImage: "arms.jpg"),
  WorkoutSelection(
      name: "Chest Workout",
      workoutClass: "Advanced",
      timeRange: "45-60 Mins",
      equipmentRequired: false,
      avatarImage: "chest.jpg"),
  WorkoutSelection(
      name: "Shoulder & Back Workout",
      workoutClass: "Advanced",
      timeRange: "45-60 Mins",
      equipmentRequired: false,
      avatarImage: "s_and_b.jpg"),
  WorkoutSelection(
      name: "Abs Workout",
      workoutClass: "Advanced",
      timeRange: "45-60 Mins",
      equipmentRequired: false,
      avatarImage: "abs.jpg"),
  WorkoutSelection(
      name: "Leg Workout",
      workoutClass: "Advanced",
      timeRange: "45-60 Mins",
      equipmentRequired: false,
      avatarImage: "leg.png"),
  WorkoutSelection(
      name: "Arms Workout",
      workoutClass: "Advanced",
      timeRange: "45-65 Mins",
      equipmentRequired: true,
      avatarImage: "arms.jpg"),
  WorkoutSelection(
      name: "Chest Workout",
      workoutClass: "Advanced",
      timeRange: "45-65 Mins",
      equipmentRequired: true,
      avatarImage: "chest.jpg"),
  WorkoutSelection(
      name: "Shoulder & Back Workout",
      workoutClass: "Advanced",
      timeRange: "45-65 Mins",
      equipmentRequired: true,
      avatarImage: "s_and_b.jpg"),
  WorkoutSelection(
      name: "Abs Workout",
      workoutClass: "Advanced",
      timeRange: "45-65 Mins",
      equipmentRequired: true,
      avatarImage: "abs.jpg"),
  WorkoutSelection(
      name: "Leg Workout",
      workoutClass: "Advanced",
      timeRange: "45-65 Mins",
      equipmentRequired: true,
      avatarImage: "leg.png"),
];
