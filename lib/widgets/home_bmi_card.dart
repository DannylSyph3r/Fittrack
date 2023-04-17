import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fittrack/screens/bmi_calculator_screen.dart';
import 'package:fittrack/utils/theme_colors.dart';
import 'package:flutter/material.dart';

class BMICardWidget extends StatefulWidget {
  const BMICardWidget({super.key});

  @override
  State<BMICardWidget> createState() => _BMICardWidgetState();
}

class _BMICardWidgetState extends State<BMICardWidget> {
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: CustomColors.settingsCardColor,
          borderRadius: BorderRadius.circular(20)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 25),
          child: Column(
            children: [
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [const Text("BMI (Body Mass Index)")],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('fittrackUsers')
                        .where('email',
                            isEqualTo: FirebaseAuth.instance.currentUser?.email)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        final DocumentSnapshot userDoc =
                            snapshot.data!.docs.first;
                        final double weight = double.parse(userDoc['weight']);
                        final double height = double.parse(userDoc['height']);
                        final double cardWidgetBmi =
                            weight / pow(height / 100, 2);
                        return Text(
                          cardWidgetBmi.toStringAsFixed(1),
                          style: const TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w500),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  )
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20, top: 25, bottom: 28),
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('fittrackUsers')
                    .where('email',
                        isEqualTo: FirebaseAuth.instance.currentUser?.email)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    final DocumentSnapshot userDoc = snapshot.data!.docs.first;
                    final double weight = double.parse(userDoc['weight']);
                    final double height = double.parse(userDoc['height']);
                    final double cardBmiIndication =
                        weight / pow(height / 100, 2);
                    if (cardBmiIndication < 18.5) {
                      return Row(
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 6),
                          const Text(
                            'Underweight',
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      );
                    } else if (cardBmiIndication >= 18.5 &&
                        cardBmiIndication <= 24.9) {
                      return Row(
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 59, 235, 64),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 6),
                          const Text(
                            'Healthy',
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      );
                    } else if (cardBmiIndication >= 25 &&
                        cardBmiIndication <= 29.9) {
                      return Row(
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 6),
                          const Text(
                            'Overweight',
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      );
                    } else if (cardBmiIndication >= 30 &&
                        cardBmiIndication <= 39.9) {
                      return Row(
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 6),
                          const Text(
                            'Obese',
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      );
                    } else {
                      return Row(
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 255, 17, 0),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 6),
                          const Text(
                            'Severely Obese',
                            style: TextStyle(fontSize: 13, color: Colors.white),
                          ),
                        ],
                      );
                    }
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BMICalculatorScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.secondButtonColor,
                      fixedSize: const Size(120, 35),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    child: const Text(
                      "Calculate BMI",
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}
