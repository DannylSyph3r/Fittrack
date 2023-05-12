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

// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

// class NotificationScreen extends StatefulWidget {
//   const NotificationScreen({Key? key}) : super(key: key);

//   @override
//   _NotificationScreenState createState() => _NotificationScreenState();
// }

// class _NotificationScreenState extends State<NotificationScreen> {
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   bool _switchValue = false;

//   Future<void> _scheduleNotification() async {
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'daily_notification',
//       'Daily Notification',
//       'Daily notification to remind you about work.',
//       importance: Importance.max,
//       priority: Priority.high,
//       showWhen: false,
//     );
//     const NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);

//     await flutterLocalNotificationsPlugin.zonedSchedule(
//         0,
//         'Time to get to work',
//         'Quality over Quantity!',
//         _nextInstanceOf9AM(),
//         platformChannelSpecifics,
//         androidAllowWhileIdle: true,
//         uiLocalNotificationDateInterpretation:
//             UILocalNotificationDateInterpretation.absoluteTime);
//   }

//   tz.TZDateTime _nextInstanceOf9AM() {
//     tz.initializeTimeZones();
//     final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
//     final tz.TZDateTime scheduledDate =
//         tz.TZDateTime(tz.local, now.year, now.month, now.day, 9);
//     return scheduledDate.isBefore(now)
//         ? scheduledDate.add(const Duration(days: 1))
//         : scheduledDate;
//   }

//   @override
//   void initState() {
//     super.initState();
//     final android = AndroidInitializationSettings('@mipmap/ic_launcher');
//     final iOS = IOSInitializationSettings();
//     final initializationSettings =
//         InitializationSettings(android: android, iOS: iOS);
//     flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Notification'),
//       ),
//       body: Column(
//         children: [
//           SwitchListTile(
//             title: const Text('Daily Reminder'),
//             value: _switchValue,
//             onChanged: (bool value) {
//               setState(() {
//                 _switchValue = value;
//                 if (_switchValue) {
//                   _scheduleNotification();
//                 } else {
//                   flutterLocalNotificationsPlugin.cancelAll();
//                 }
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
