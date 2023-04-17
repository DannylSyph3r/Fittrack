import 'package:fittrack/screens/activity_tracker_screen.dart';
import 'package:fittrack/screens/home_screen_fittrack.dart';
import 'package:fittrack/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class FitTrackNavBar extends StatefulWidget {
  const FitTrackNavBar({super.key});

  @override
  State<FitTrackNavBar> createState() => _FitTrackNavBarState();
}

class _FitTrackNavBarState extends State<FitTrackNavBar> {
   int _selectedIndex = 0;
   final List<Widget> _tabs = [
    const MainHomeScreen(),
    const ActivityTrackerScreen(),
    const SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: GNav(
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.blue,
              tabBackgroundColor: Colors.grey.shade800,
              gap: 10,
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              padding: const EdgeInsets.all(17),
              tabs: const [
                GButton(
                  icon: LineIcons.home,
                  text: "Home",
                ),
                GButton(
                  icon: LineIcons.lineChart, 
                  text: "Activity"),
                GButton(
                  icon: LineIcons.user,
                  text: "Profile",
                )
              ]),
        ),
      ),
      body: _tabs[_selectedIndex],
    );
  }
}