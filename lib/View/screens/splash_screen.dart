import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nutri_fit/View/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Simulate app initialization time
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen()), // Navigate to main screen
      );
    });

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'asset/image/food.jpg',  // Adjust the path and file name as per your image
            fit: BoxFit.cover,
          ),
          Positioned(child: Text('Nutri Fit')),
        ],
      ),
    );
  }
}