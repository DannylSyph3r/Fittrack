import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/icons/dumbbell.png",
                    height: 120,
                    width: 120,
                    ),
            const SizedBox(height: 100,),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
