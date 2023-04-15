import 'package:fittrack/utils/bmi_constant.dart';
import 'package:fittrack/utils/theme_colors.dart';
import 'package:fittrack/widgets/app_buttons.dart';
import 'package:fittrack/widgets/bmi_graph.dart';
import 'package:fittrack/widgets/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({super.key, 
    required this.interpretation,
    required this.bmiResult,
    required this.resultText,
    required this.normalWeightHigh,
    required this.normalWeightLow,
  });

  final String bmiResult;
  final String resultText;
  final String interpretation;
  final String normalWeightHigh;
  final String normalWeightLow;
  
  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  late double graphBMI;

  @override
  void initState() {
    super.initState();
    graphBMI = double.tryParse(widget.bmiResult) ?? 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade600,
      appBar: AppBar(
        backgroundColor: CustomColors.appBarColor,
      ),
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  const Text(
                    'Result',
                    style: kTitleTextStyle,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ReusableCard(
                    colour: Colors.grey.shade300,
                    cardChild: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Your Current BMI",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            widget.bmiResult,
                            style: kBMITextStyle,
                          ),
                          widget.resultText == 'Underweight'
                              ? Text(
                                  widget.resultText,
                                  style: kResultTextStyle.copyWith(
                                      color: Colors.blue, fontSize: 22),
                                )
                              : widget.resultText == 'Normal and Healthy'
                                  ? Text(
                                          widget.resultText,
                                          style: kResultTextStyle.copyWith(
                                              color: Colors.green,
                                              fontSize: 22),
                                        )
                              : widget.resultText == 'Overweight'
                                  ? Text(
                                          widget.resultText,
                                          style: kResultTextStyle.copyWith(
                                              color: Colors.orange,
                                              fontSize: 22),
                                        )
                                  : widget.resultText == 'Obese'
                                      ? Text(
                                          widget.resultText,
                                          style: kResultTextStyle.copyWith(
                                              color: Colors.red,
                                              fontSize: 22),
                                        )
                                      : Text(
                                          widget.resultText,
                                          style: kResultTextStyle.copyWith(
                                              color: const Color.fromARGB(255, 255, 17, 0), fontSize: 22),
                                        ),
                          const SizedBox(
                            height: 30,
                          ),
                          BMIBarGraph(graphInputBMI: graphBMI ),
                          const SizedBox(
                            height: 30,
                          ),
                          widget.resultText != 'Normal and Healthy'
                              ? Text(
                                  "For your height, a normal weight range will be from ${widget.normalWeightLow} to ${widget.normalWeightHigh} to keep healthy and keep your BMI readings normal",
                                  textAlign: TextAlign.justify,
                                  style: kBodyTextStyle.copyWith(
                                      color: Colors.black),
                                )
                              : Text("For your height it is recommended to remain in a weight range of ${widget.normalWeightLow} to ${widget.normalWeightHigh} to remain healthy and keep your BMI readings normal",
                              textAlign: TextAlign.justify,
                                  style: kBodyTextStyle.copyWith(
                                      color: Colors.black),
                              ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 250,
                            child: Text(
                              widget.interpretation,
                              textAlign: TextAlign.justify,
                              style: kBodyTextStyle,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppButtons(
                    buttonPlaceholderText: "Recalculate BMI",
                    onButtonPress: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
