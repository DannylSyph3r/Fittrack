import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fittrack/auth/helpers.dart';
import 'package:fittrack/screens/initialized_screen.dart';
import 'package:fittrack/utils/theme_colors.dart';
import 'package:fittrack/widgets/about_fittrack_button.dart';
import 'package:fittrack/widgets/app_buttons.dart';
import 'package:fittrack/widgets/change_height_widget.dart';
import 'package:fittrack/widgets/change_weight_button.dart';
import 'package:fittrack/widgets/home_bmi_card.dart';
import 'package:fittrack/widgets/metric_change_textfield.dart';
import 'package:fittrack/widgets/pop_up_notis_widget.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  AuthService authenticationService = AuthService();
  final user = FirebaseAuth.instance.currentUser!;
  final _weightChangeController = TextEditingController();
  final _heightChangeController = TextEditingController();

  @override
  void dispose() {
    _weightChangeController.dispose();
    _heightChangeController.dispose();
    super.dispose();
  }

  void showCustomDialog(BuildContext context, String title, String content,
      List<Widget> actions) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        title: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(LineIcons.exclamationCircle,
                  color: Colors.blue.shade900),
            ),
            Text(
              title,
              style: const TextStyle(
                  color: CustomColors.secondButtonColor,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        content: Text(
          content,
          textAlign: TextAlign.justify,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        actions: actions,
      ),
    );
  }

  void _displayModalBottomSheet(BuildContext context, modallabelText,
      controller, hinttext, placeholderIcon, buttonFunction) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 400.0,
          color: Colors.transparent,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                modallabelText,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: MetricChangeTextField(
                  controller: controller,
                  hintText: hinttext,
                  obscureText: false,
                  placeholderIcon: placeholderIcon,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              AppButtons(
                  onButtonPress: buttonFunction,
                  buttonPlaceholderText: "Submit")
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('fittrackUsers')
                              .where('email',
                                  isEqualTo:
                                      FirebaseAuth.instance.currentUser?.email)
                              .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasData) {
                              final DocumentSnapshot userDoc =
                                  snapshot.data!.docs.first;
                              final String firstName = userDoc['firstname'];
                              final String lastName = userDoc['lastname'];
                              return Text(
                                "$firstName $lastName",
                                style: const TextStyle(
                                    fontSize: 21, fontWeight: FontWeight.w400),
                              );
                            } else {
                              return const SizedBox();
                            }
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('fittrackUsers')
                              .where('email',
                                  isEqualTo:
                                      FirebaseAuth.instance.currentUser?.email)
                              .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasData) {
                              final DocumentSnapshot userDoc =
                                  snapshot.data!.docs.first;
                              final String userGender = userDoc['gender'];
                              final String programGoal = userDoc['goal'];
                              return Row(
                                children: [
                                  Text(
                                    userGender,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  const Text('|'),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "Goal: $programGoal",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
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
                        ElevatedButton(
                          onPressed: () {
                            FirebaseAuth.instance.signOut();
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const InitializedScreen()),
                              (Route<dynamic> route) => false,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 86, 110, 231),
                              fixedSize: const Size(120, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18))),
                          child: const Text(
                            "Log Out",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 90,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: CustomColors.settingsCardColor),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
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
                                        final String userHeight =
                                            userDoc['height'];
                                        return Text(
                                          "$userHeight cm",
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        );
                                      } else {
                                        return const SizedBox();
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Height",
                                    style: TextStyle(fontSize: 12),
                                  )
                                ]),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        children: [
                          Container(
                            height: 90,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: CustomColors.settingsCardColor),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
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
                                        final String userWeight =
                                            userDoc['weight'];
                                        return Text(
                                          "$userWeight kg",
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        );
                                      } else {
                                        return const SizedBox();
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Weight",
                                    style: TextStyle(fontSize: 12),
                                  )
                                ]),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        children: [
                          Container(
                            height: 90,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: CustomColors.settingsCardColor),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
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
                                        String dobText = userDoc['dob'];
                                        List<String> dobParts =
                                            dobText.split('/');
                                        DateTime dob = DateTime(
                                            int.parse(dobParts[2]),
                                            int.parse(dobParts[1]),
                                            int.parse(dobParts[0]));
                                        Duration difference =
                                            DateTime.now().difference(dob);
                                        int age =
                                            (difference.inDays / 365).round();
                                        return Text(
                                          "$age Yrs",
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        );
                                      } else {
                                        return const SizedBox();
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Age",
                                    style: TextStyle(fontSize: 12),
                                  )
                                ]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const BMICardWidget(),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                    onTap: () {
                      showCustomDialog(
                        context,
                        "Change Weight",
                        "Are you sure you want to change your weight?",
                        [
                          TextButton.icon(
                            icon: const Icon(LineIcons.times),
                            onPressed: () => Navigator.pop(context),
                            style: TextButton.styleFrom(
                                iconColor: Colors.blue.shade900),
                            label: Text('NO',
                                style: TextStyle(color: Colors.blue.shade900)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: TextButton.icon(
                              icon: const Icon(LineIcons.check),
                              onPressed: () {
                                Navigator.pop(context);
                                _displayModalBottomSheet(
                                  context,
                                  "Enter your Weight",
                                  _weightChangeController,
                                  "Weight in (KG)",
                                  const Icon(LineIcons.weight),
                                  () async {
                                    if (_weightChangeController
                                        .text.isNotEmpty) {
                                      await authenticationService
                                          .updateUserWeight(
                                              user.email,
                                              double.parse(
                                                  _weightChangeController.text
                                                      .trim()),
                                              context);
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text("Please input a value")),
                                      );
                                    }
                                  },
                                );
                              },
                              style: TextButton.styleFrom(
                                  iconColor: Colors.blue.shade900),
                              label: Text('YES',
                                  style:
                                      TextStyle(color: Colors.blue.shade900)),
                            ),
                          ),
                        ],
                      );
                    },
                    child: const ChangeWeightWidget()),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                    onTap: () {
                      showCustomDialog(
                        context,
                        "Change Height",
                        "Are you sure you want to change your height?",
                        [
                          TextButton.icon(
                            icon: const Icon(LineIcons.times),
                            onPressed: () => Navigator.pop(context),
                            style: TextButton.styleFrom(
                                iconColor: Colors.blue.shade900),
                            label: Text('NO',
                                style: TextStyle(color: Colors.blue.shade900)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: TextButton.icon(
                              icon: const Icon(LineIcons.check),
                              onPressed: () {
                                Navigator.pop(context);
                                _displayModalBottomSheet(
                                  context,
                                  "Enter your Height",
                                  _heightChangeController,
                                  "Height in (CM)",
                                  const Icon(LineIcons.arrowCircleUp),
                                  () async {
                                    if (_heightChangeController
                                        .text.isNotEmpty) {
                                      await authenticationService
                                          .updateUserHeight(
                                              user.email,
                                              double.parse(
                                                  _heightChangeController.text
                                                      .trim()),
                                              context);
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text("Please input a value")),
                                      );
                                    }
                                  },
                                );
                              },
                              style: TextButton.styleFrom(
                                  iconColor: Colors.blue.shade900),
                              label: Text('YES',
                                  style:
                                      TextStyle(color: Colors.blue.shade900)),
                            ),
                          ),
                        ],
                      );
                    },
                    child: const ChangeHeightWidget()),
                const SizedBox(
                  height: 15,
                ),
                const PopUpNotificationsWidget(),
                const SizedBox(
                  height: 15,
                ),
                const AboutFittrackButton(),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(LineIcons.copyrightAlt),
                    SizedBox(
                      width: 4,
                    ),
                    Text("2023 FitTrack Inc. All rights reserved")
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
