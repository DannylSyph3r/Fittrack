import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fittrack/screens/initialized_screen.dart';
import 'package:fittrack/screens/login_screen.dart';
import 'package:fittrack/utils/theme_colors.dart';
import 'package:fittrack/widgets/home_bmi_card.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key, required String firstName});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_constructors
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.blue,
              tabBackgroundColor: Colors.grey.shade800,
              gap: 10,
              onTabChange: (index) {},
              padding: EdgeInsets.all(17),
              tabs: const [
                GButton(
                  icon: LineIcons.home,
                  text: "Home",
                ),
                GButton(icon: LineIcons.lineChart, text: "Activity"),
                GButton(
                  icon: LineIcons.dumbbell,
                  text: "Workouts",
                ),
                GButton(
                  icon: LineIcons.user,
                  text: "Profile",
                )
              ]),
        ),
      ),
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
                      const SizedBox(height: 30),
                      BMICardWidget(),
                      const SizedBox(
                        height: 15,
                      ),
                      MaterialButton(
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
                        color: CustomColors.buttonColor,
                        child: const Text("Sign out"),
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
