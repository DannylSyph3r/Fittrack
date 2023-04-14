import 'package:fittrack/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

class PopUpNotificationsWidget extends StatefulWidget {
  const PopUpNotificationsWidget({super.key});

  @override
  State<PopUpNotificationsWidget> createState() =>
      _PopUpNotificationsWidgetState();
}

class _PopUpNotificationsWidgetState extends State<PopUpNotificationsWidget> {
  bool _isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: CustomColors.settingsCardColor),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  LineIcon.bell(),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text("Pop-up Notifications")
                ],
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Switch(
                activeColor: Colors.purple,                value: _isSwitched,
                onChanged: (value) {
                  setState(() {
                    _isSwitched = value;
                  });
                },
              )
            ],
          )
        ]),
      ),
    );
  }
}
