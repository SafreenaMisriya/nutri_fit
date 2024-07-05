import 'package:flutter/material.dart';
import 'package:nutri_fit/Controller/repository.dart';
import 'package:nutri_fit/View/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => RecipeProvider(),
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home:HomeScreen(),
    );
  }
}
