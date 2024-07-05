// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:nutri_fit/Model/recipe_model.dart';
import 'package:nutri_fit/View/utils/colour.dart';
import 'package:nutri_fit/View/utils/fonts.dart';
import 'package:nutri_fit/View/utils/resposive.dart';
import 'package:nutri_fit/View/widgets/appbar.dart';
import 'package:url_launcher/url_launcher.dart';

class Searchview extends StatelessWidget {
  final RecipeModel recipe;
  const Searchview({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    double height = Responsive.screenHeight(context);
    double width = Responsive.screenWidth(context);
    return SafeArea(
      child: Scaffold(
        appBar: customappbar(recipe.shareAs, context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: height * 0.23,
                    width: double.infinity,
                    color: greencolor,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: const Offset(10, 7), 
                        ),
                      ],
                    ),
                    height: height * 0.40,
                    width: width * 0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        fit: BoxFit.cover,
                        recipe.image,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: myfonts2(recipe.label),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        child: Container(
                          height: height * 0.09,
                          width: width * 0.2,
                          decoration: BoxDecoration(
                              color: greencolor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            Icons.fastfood_sharp,
                            color: whitecolor,
                            size: height * 0.04,
                          ),
                        ),
                        onTap: () async {
                          final Uri url = Uri.parse(recipe.url);
                          if (!await launchUrl(url)) {
                            throw Exception('Could not launch $url');
                          }
                        },
                      ),
                      myfonts('Recipe'),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        child: Container(
                          height: height * 0.09,
                          width: width * 0.2,
                          decoration: BoxDecoration(
                              color: greencolor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            Icons.fitness_center_sharp,
                            color: whitecolor,
                            size: height * 0.04,
                          ),
                        ),
                        onTap: () async {
                          final Uri url = Uri.parse(recipe.shareAs);
                          if (!await launchUrl(url)) {
                            throw Exception('Could not launch $url');
                          }
                        },
                      ),
                      myfonts('Nutrition'),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              recipe.dietLabels.join().isEmpty
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myfonts2(recipe.dietLabels.join(' ◉ ')),
                    ),
              SizedBox(
                height: height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: myfonts4(recipe.healthLabels.join(' ◉ ')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
