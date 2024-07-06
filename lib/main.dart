import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nutri_fit/Controller/database.dart';
import 'package:nutri_fit/Controller/repository.dart';
import 'package:nutri_fit/Model/recipe_model.dart';
import 'package:nutri_fit/View/screens/home_screen.dart';
import 'package:nutri_fit/View/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(RecipeModelAdapter());
  await Hive.openBox<RecipeModel>('favorites');
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => RecipeProvider(),
      ),
      ChangeNotifierProvider(create: (context) => FavoriteProvider())
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: SplashScreen(),
    );
  }
}
