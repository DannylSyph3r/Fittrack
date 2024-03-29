import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
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
