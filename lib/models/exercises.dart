class Exercise {
  String videoUrl;
  String name;
  String exerciseClass;
  String bodyPartFocus;
  int exerciseCalories;
  int sets;
  int reps;
  String description;
  bool equipmentUse;
  String equipment;
  String setsRestTime;

  Exercise({
    required this.videoUrl,
    required this.name,
    required this.exerciseClass,
    required this.bodyPartFocus,
    required this.exerciseCalories,
    required this.sets,
    required this.reps,
    required this.description,
    required this.equipmentUse,
    required this.equipment,
    required this.setsRestTime,
  });
}

final List<Exercise> exercisesList = [
  Exercise(
    videoUrl: 'Bqvmyni_sKQ',
    name: 'Arm Raises',
    exerciseClass: 'Beginner',
    bodyPartFocus: 'Arms Workout',
    exerciseCalories: 35,
    sets: 1,
    reps: 20,
    description:
        "Stand straight with your feet shoulder-width apart and your arms by your sides. Keep your palms facing your thighs, and your elbows straight, but not locked. Slowly raise your arms forward and upward until they are at shoulder height, keeping your arms straight throughout the movement. Pause for a second, then slowly lower your arms back down to your sides, keeping them straight. Repeat the movement for the desired number of repetitions. (It's important to engage your core muscles and maintain proper posture throughout the exercise to avoid any strain on your lower back.)",
    equipmentUse: false,
    equipment: 'None',
    setsRestTime: '30 seconds',
  ),
  Exercise(
    videoUrl: 'YslHgg2E-Ro',
    name: 'Side Arm Raises',
    exerciseClass: 'Beginner',
    bodyPartFocus: 'Arms Workout',
    exerciseCalories: 30,
    sets: 1,
    reps: 20,
    description:
        "Stand straight with your feet shoulder-width apart and your arms by your sides. Keep your palms facing your thighs, and your elbows straight, but not locked. Slowly raise your arms to the sides, keeping them straight throughout the movement. Continue raising your arms until they are at shoulder height, parallel to the ground. Your palms should be facing downwards. Pause for a second, then slowly lower your arms back down to your sides, keeping them straight. Repeat the movement for the desired number of repetitions. (It's important to engage your core muscles and maintain proper posture throughout the exercise to avoid any strain on your lower back. You can also vary the exercise by using dumbbells or resistance bands to increase the intensity.)",
    equipmentUse: false,
    equipment: 'None',
    setsRestTime: '35 seconds',
  ),
  Exercise(
    videoUrl: 'jWxvty2KROs',
    name: 'Knee Pushups',
    exerciseClass: 'Beginner',
    bodyPartFocus: 'Arms Workout',
    exerciseCalories: 40,
    sets: 2,
    reps: 7,
    description:
        "Start by getting down on all fours, with your hands placed slightly wider than shoulder-width apart and your knees on the floor. Keep your back straight and your core engaged, and lower your body towards the floor by bending your elbows. Your elbows should point outwards, away from your body. Continue lowering your body until your chest touches the floor or your arms are at a 90-degree angle. Pause briefly, then push your body back up to the starting position by straightening your arms. Repeat the exercise for the desired number of reps or sets. (It's important to maintain proper form during the exercise and avoid arching or sagging your back, which can put undue stress on your spine. As a beginner, you can start with a few reps and gradually increase the number of reps and sets as you become more comfortable with the exercise.)",
    equipmentUse: false,
    equipment: 'None',
    setsRestTime: '40 seconds',
  ),
  Exercise(
    videoUrl: 'Z0bRiVhnO8Q',
    name: 'Inclined Pushups',
    exerciseClass: 'Beginner',
    bodyPartFocus: 'Arms Workout',
    exerciseCalories: 65,
    sets: 2,
    reps: 7,
    description:
        "Start by standing facing a sturdy elevated surface, such as a bench, table or a stair step. Place your hands on the elevated surface, shoulder-width apart, with your fingers facing forward and your arms fully extended. Step back with your feet, so that your body forms a straight line from your head to your heels, and your feet are shoulder-width apart. Keep your back straight, your core engaged and your elbows close to your body. Lower your body towards the elevated surface by bending your elbows until your chest touches the surface or your arms are at a 90-degree angle. Pause briefly, then push your body back up to the starting position by straightening your arms. Repeat the exercise for the desired number of reps or sets. (It's important to maintain proper form during the exercise and avoid arching or sagging your back, which can put undue stress on your spine. As a beginner, you can start with a few reps and gradually increase the number of reps and sets as you become more comfortable with the exercise.)",
    equipmentUse: false,
    equipment: 'None',
    setsRestTime: '60 seconds',
  ),
  Exercise(
    videoUrl: 'IODxDxX7oi4',
    name: 'Regular Pushups',
    exerciseClass: 'Beginner',
    bodyPartFocus: 'Arms Workout',
    exerciseCalories: 60,
    sets: 2,
    reps: 10,
    description:
        "Start by getting down on all fours on the floor, with your hands placed slightly wider than shoulder-width apart and your feet together. Keep your back straight and your core engaged, and lower your body towards the floor by bending your elbows. Your elbows should point outwards, away from your body. Continue lowering your body until your chest touches the floor or your arms are at a 90-degree angle. Pause briefly, then push your body back up to the starting position by straightening your arms. Repeat the exercise for the desired number of reps or sets. (It's important to maintain proper form during the exercise and avoid arching or sagging your back, which can put undue stress on your spine).",
    equipmentUse: false,
    equipment: 'None',
    setsRestTime: '40 seconds',
  ),
  Exercise(
    videoUrl: "AWz_7B1cch0",
    name: "Tricep Dips",
    exerciseClass: "Beginner",
    bodyPartFocus: "Arms Workout",
    exerciseCalories: 70,
    sets: 2,
    reps: 10,
    description:
        "Start by sitting on the edge of a sturdy chair or bench with your hands placed on either side of your hips, fingers pointing forward. Keep your back straight and your feet flat on the ground, hip-width apart. Slowly slide your hips off the edge of the chair and straighten your arms, using your hands to support your body weight. Keep your elbows close to your body, and slowly lower your body towards the ground by bending your elbows until they form a 90-degree angle. Pause briefly, then push your body back up to the starting position by straightening your arms. Repeat the exercise for the desired number of reps or sets. (It's important to maintain proper form during the exercise and avoid arching or sagging your back, which can put undue stress on your spine.).",
    equipmentUse: false,
    equipment: "None",
    setsRestTime: "40 seconds",
  ),
  Exercise(
    videoUrl: "VSp0z7Mp5IU",
    name: "Inchworms",
    exerciseClass: "Beginner",
    bodyPartFocus: "Arms Workout",
    exerciseCalories: 65,
    sets: 2,
    reps: 10,
    description:
        "Start by standing with your feet hip-width apart and your arms at your sides. Slowly bend forward at the waist, reaching your hands towards the ground as you lower your torso towards your feet. Once your hands reach the ground, walk them forward slowly, keeping your legs straight, until you are in a push-up position. Pause briefly, then slowly walk your hands back towards your feet, keeping your legs straight, until you return to the starting position. Repeat the exercise for the desired number of reps or sets. (It's important to maintain proper form during the exercise by keeping your core engaged and your back straight throughout the movement.)",
    equipmentUse: false,
    equipment: "None",
    setsRestTime: "50 seconds",
  ),
  Exercise(
      videoUrl: "QGnz__47PCo",
      name: "Plank Taps",
      exerciseClass: "Beginner",
      bodyPartFocus: "Arms Workout",
      exerciseCalories: 70,
      sets: 1,
      reps: 12,
      description:
          "Start in a high plank position, with your hands directly beneath your shoulders and your feet hip-width apart. Engage your core and keep your back flat as you lift your right hand and tap your left shoulder. Lower your right hand back down to the starting position, and repeat the movement with your left hand tapping your right shoulder. Alternate tapping your shoulders for the desired number of reps or sets. Be sure to maintain proper form by keeping your core engaged, your back straight, and your hips level throughout the movement. (This exercise primarily targets the muscles in your arms and core, and can be modified to increase or decrease the difficulty by changing the tempo of the taps or by increasing or decreasing the distance between your feet.).",
      equipmentUse: false,
      equipment: "None",
      setsRestTime: "40 seconds"
  ),
  Exercise(
      videoUrl: "nGaXj3kkmrU",
      name: "Arm Circles",
      exerciseClass: "Beginner",
      bodyPartFocus: "Arms Workout",
      exerciseCalories: 60,
      sets: 1,
      reps: 20,
      description:
          "Stand up straight with your feet shoulder-width apart, and extend your arms out to the sides at shoulder height. Start making small circles with your arms, gradually increasing the size of the circles until you're making full rotations with your arms. Then, reverse the direction of the circles. Repeat for the desired number of reps. (This exercise can help improve shoulder mobility, flexibility, and overall arm strength.).",
      equipmentUse: false,
      equipment: "None",
      setsRestTime: "40 seconds"
  ),
  Exercise(
      videoUrl: "SKPab2YC8BE",
      name: "Declined Pushups",
      exerciseClass: "Beginner",
      bodyPartFocus: "Arms Workout",
      exerciseCalories: 75,
      sets: 2,
      reps: 7,
      description: "Get into a pushup position with your feet on a raised platform, such as a bench or step. Make sure your hands are shoulder-width apart and your arms are straight. Lower your body towards the floor, keeping your elbows close to your body. Push your body back up to the starting position, using your chest, shoulders, and triceps to lift yourself. Repeat for the desired number of reps and sets, making sure to keep your core engaged and your body in a straight line throughout the exercise.",
      equipmentUse: false,
      equipment: "None",
      setsRestTime: "45 seconds"),
];
