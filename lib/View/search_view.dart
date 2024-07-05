// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nutri_fit/Model/recipe_model.dart';
import 'package:nutri_fit/View/utils/resposive.dart';
import 'package:nutri_fit/View/widgets/appbar.dart';

class Searchview extends StatelessWidget {
  final RecipeModel recipe;
  const Searchview({super.key,required this.recipe});

  @override
  Widget build(BuildContext context) {
    double height = Responsive.screenHeight(context);
    return SafeArea(
      child: Scaffold(
        appBar: customappbar(recipe.shareAs),
        body: Column(children: [
           SizedBox(height: height*0.1,)  ,  
          Center(
            child: Stack(
              children: [
                ClipRRect(
                   borderRadius: BorderRadius.circular(10),
                  child: Image.network(recipe.image)),
              ],
            ),
          )      
        ],),
      ),
    );
  }
}