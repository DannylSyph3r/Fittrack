import 'package:fittrack/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

class ChangeHeightWidget extends StatelessWidget {
  const ChangeHeightWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: CustomColors.settingsCardColor
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              Row(children: [
                LineIcon.arrowCircleUp(),
            const SizedBox(width: 10,),
            const Text("Change Height")
              ],)
              
            ],),
            Column(children: [
              LineIcon.arrowRight()
            ],)
            
          ]),
      ),
    );
  }
}