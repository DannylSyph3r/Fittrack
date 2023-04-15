import 'package:fittrack/screens/bmi_results.dart';
import 'package:fittrack/utils/bmi_constant.dart';
import 'package:fittrack/utils/calculate_bmi.dart';
import 'package:fittrack/utils/theme_colors.dart';
import 'package:fittrack/widgets/app_buttons.dart';
import 'package:fittrack/widgets/icon_content.dart';
import 'package:fittrack/widgets/reusable_card.dart';
import 'package:fittrack/widgets/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

enum Gender { male, female }

class BMICalculatorScreen extends StatefulWidget {
  const BMICalculatorScreen({super.key});

  @override
  State<BMICalculatorScreen> createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  Gender? _bmiSelectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        backgroundColor: CustomColors.appBarColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "Gender",
                    style: metricLabelTextStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: ReusableCard(
                          onPress: () {
                            setState(() {
                              _bmiSelectedGender = Gender.male;
                            });
                          },
                          colour: _bmiSelectedGender == Gender.male
                              ? kActiveCardColour
                              : kInactiveCardColour,
                          cardChild: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      LineIcons.checkCircleAlt,
                                      color: _bmiSelectedGender == Gender.male
                                          ? activeCardCheckColor
                                          : inactiveCardCheckColor,
                                    ),
                                  ],
                                ),
                                const IconContent(
                                  icon: LineIcons.male,
                                  label: 'Male',
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ReusableCard(
                          onPress: () {
                            setState(() {
                              _bmiSelectedGender = Gender.female;
                            });
                          },
                          colour: _bmiSelectedGender == Gender.female
                              ? kActiveCardColour
                              : kInactiveCardColour,
                          cardChild: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      LineIcons.checkCircleAlt,
                                      color: _bmiSelectedGender == Gender.female
                                          ? activeCardCheckColor
                                          : inactiveCardCheckColor,
                                    ),
                                  ],
                                ),
                                const IconContent(
                                  icon: LineIcons.female,
                                  label: 'Female',
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Height",
                    style: metricLabelTextStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text(
                        ' cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      activeTrackColor: Colors.purple,
                      thumbColor: CustomColors.sliderColor,
                      overlayColor: const Color(0x29EB1555),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 250.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: ReusableCard(
                          colour: kActiveCardColour,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Weight (KG)',
                                style: metricLabelTextStyle,
                              ),
                              Text(
                                weight.toString(),
                                style: kNumberTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RoundIconButton(
                                      icon: LineIcons.minus,
                                      onPressed: () {
                                        setState(() {
                                          weight--;
                                        });
                                      }),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  RoundIconButton(
                                    icon: LineIcons.plus,
                                    onPressed: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: ReusableCard(
                          colour: kActiveCardColour,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Age',
                                style: metricLabelTextStyle,
                              ),
                              Text(
                                age.toString(),
                                style: kNumberTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RoundIconButton(
                                    icon: LineIcons.minus,
                                    onPressed: () {
                                      setState(
                                        () {
                                          age--;
                                        },
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  RoundIconButton(
                                      icon: LineIcons.plus,
                                      onPressed: () {
                                        setState(() {
                                          age++;
                                        });
                                      })
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  AppButtons(buttonPlaceholderText: "Calculate", 
                  onButtonPress: () {
                    BmiLogic calc = BmiLogic(height: height, weight: weight);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultsPage(
                          bmiResult: calc.calculateBMI(),
                          resultText: calc.getResult(),
                          interpretation: calc.getInterpretation(),
                          normalWeightHigh: calc.calculateNormalWeightHigh(),
                          normalWeightLow: calc.calculateNormalWeightLow(),

                        ),
                      ),
                    );
                  },
                  ),
                  const SizedBox(height: 20,),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
