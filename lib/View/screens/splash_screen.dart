import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nutri_fit/View/screens/home_screen.dart';
import 'package:nutri_fit/View/utils/fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen()), 
      );
    });

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'asset/image/food.jpg', 
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 120,
            left: 80,
            child: heading2('N U T R I   F I T')),
        ],
      ),
    );
  }
}