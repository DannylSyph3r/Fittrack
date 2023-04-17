import 'package:firebase_auth/firebase_auth.dart';
import 'package:fittrack/auth/helpers.dart';
import 'package:fittrack/screens/signup_welcome_screen.dart';
import 'package:fittrack/utils/theme_colors.dart';
import 'package:fittrack/widgets/app_icons_buttons.dart';
import 'package:fittrack/widgets/app_textfield.dart';
import 'package:fittrack/widgets/metric_change_textfield.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

class CompleteUserProfileScreen extends StatefulWidget {
  const CompleteUserProfileScreen({super.key});

  @override
  State<CompleteUserProfileScreen> createState() =>
      _CompleteUserProfileScreenState();
}

class _CompleteUserProfileScreenState extends State<CompleteUserProfileScreen> {
  AuthService authenticationService = AuthService();
  String? selectedGender;
  String _selectedChoice = "Improve Shape";
  final user = FirebaseAuth.instance.currentUser!;
  final _programOptions = ['Improve Shape', 'Lean & Toned', 'Lose Weight'];
  final _genderOptions = ['Male', 'Female'];
  final _dateOfBirthController = TextEditingController();
  final _userBodyWeightController = TextEditingController();
  final _userHeightController = TextEditingController();
  
  @override
  void dispose() {
    _dateOfBirthController.dispose();
    _userBodyWeightController.dispose();
    _userHeightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Column(
                children: [
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Hello ",
                        style: TextStyle(fontSize: 13),
                      ),
                      Text("${user.email} ;)",
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold)),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text("|"),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          FirebaseAuth.instance.signOut();
                        },
                        child: const Text(
                          'Log out',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Image.asset("assets/images/complete_profile.png",
                      height: 375, width: 350),
                  const SizedBox(height: 35),
                  const Text("Let's complete your profile",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  const Text("It will help us know more about you!,",
                      style: TextStyle(fontSize: 12)),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 318,
                        height: 62,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 12.5,
                            ),
                            LineIcon.user(),
                            const SizedBox(
                              width: 10,
                            ),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                hint: const Text(
                                  "Choose Gender",
                                  style:
                                      TextStyle(fontSize: 13, color: Colors.grey),
                                ),
                                value: selectedGender,
                                items: _genderOptions.map(buildMenuItem).toList(),
                                onChanged: (value) =>
                                    setState(() => selectedGender = value),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 62,
                    child: AppTextField(
                      controller: _dateOfBirthController,
                      hintText: "Date of Birth (DD/MM/YYYY)",
                      obscureText: false,
                      placeholderIcon: LineIcon.calendar(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(
                              height: 62,
                              width: 270,
                              child: MetricChangeTextField(
                                keyboardType: TextInputType.number,
                                controller: _userBodyWeightController,
                                hintText: "Your Weight",
                                obscureText: false,
                                placeholderIcon: LineIcon.weight(),
                              ),
                            ),
                            Container(
                              height: 62,
                              width: 62,
                              // ignore: sort_child_properties_last
                              child: const Center(child: Text("KG")),
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        CustomColors.firstGradientColor,
                                        CustomColors.secondGradientColor
                                      ])),
                            ),
                            
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(
                              height: 62,
                              width: 270,
                              child: MetricChangeTextField(
                                controller: _userHeightController,
                                keyboardType: TextInputType.number,
                                hintText: "Your Height",
                                obscureText: false,
                                placeholderIcon: LineIcon.arrowUp(),
                              ),
                            ),
                            Container(
                              height: 62,
                              width: 62,
                              // ignore: sort_child_properties_last
                              child: const Center(child: Text("CM")),
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        CustomColors.firstGradientColor,
                                        CustomColors.secondGradientColor
                                      ])),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35),
                  const Text(
                    "What is your goal ?",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "It will help us choose the best program for you",
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: SizedBox(
                      child: Column(
                        children: [
                          CheckboxListTile(
                            title: Row(
                              children: [
                                const Text('Improve Shape'),
                                const SizedBox(width: 4.0),
                                LineIcon.dumbbell(),
                              ],
                            ),
                            // ignore: unrelated_type_equality_checks
                            value: _selectedChoice == _programOptions[0],
                            onChanged: (value) {
                              setState(() {
                                _selectedChoice = _programOptions[0];
                              });
                            },
                          ),
                          CheckboxListTile(
                            title: Row(
                              children: [
                                const Text('Lean & Toned'),
                                const SizedBox(width: 4.0),
                                LineIcon.rockHand(),
                              ],
                            ),
                            // ignore: unrelated_type_equality_checks
                            value: _selectedChoice == _programOptions[1],
                            onChanged: (value) {
                              setState(() {
                                _selectedChoice = _programOptions[1];
                              });
                            },
                          ),
                          CheckboxListTile(
                            title: Row(
                              children: [
                                const Text('Lose Weight'),
                                const SizedBox(width: 4.0),
                                LineIcon.running(),
                              ],
                            ),
                            value: _selectedChoice == _programOptions[2],
                            onChanged: (value) {
                              setState(() {
                                _selectedChoice = _programOptions[2];
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  AppIconButtons(
                      onButtonPress: () async {
                        if (selectedGender != null &&
                            _dateOfBirthController.text.isNotEmpty &&
                            _userBodyWeightController.text.isNotEmpty &&
                            _userHeightController.text.isNotEmpty) {
                          await authenticationService.addCompleteProfileDetails(
                              user.email,
                              selectedGender,
                              _dateOfBirthController.text,
                              _userHeightController.text.trim(),
                              _userBodyWeightController.text.trim(),
                              _selectedChoice,
                              context);
                          // After adding complete profile details, navigate to SignUpWelcomeScreen
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpWelcomeScreen()));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "Please fill out all textfields, checkboxes and select a gender before proceeding!")),
                          );
                        }
                      },
                      buttonPlaceholderText: "Next",
                      buttonPlaceholderIcon: LineIcon.angleRight()),
                  const SizedBox(height: 40),
                ],
              ),
            ],
          )),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      );
}
