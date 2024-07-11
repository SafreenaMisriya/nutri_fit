// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:nutri_fit/Controller/database.dart';
import 'package:nutri_fit/Model/recipe_model.dart';
import 'package:nutri_fit/View/utils/colour.dart';
import 'package:nutri_fit/View/utils/fonts.dart';
import 'package:nutri_fit/View/utils/resposive.dart';
import 'package:nutri_fit/View/utils/snakbar.dart';
import 'package:nutri_fit/View/widgets/appbar.dart';
import 'package:provider/provider.dart';
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
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      color: greencolor,
                    ),
                    height: height * 0.23,
                    width: double.infinity,
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
                  Positioned(
                    right: 60,
                    top: 20,
                    child: Consumer<FavoriteProvider>(
                      builder: (context, favoriteProvider, child) {
                        bool isFavorite = favoriteProvider.list
                            .any((element) => element.url == recipe.url);
                        return IconButton(
                          onPressed: () {
                            if (isFavorite) {
                              favoriteProvider.removeFavorite(recipe);
                              snakbardeleteMessage(context, 'Removed from favorites');
                            } else {
                              favoriteProvider.addFavorite(recipe);
                              snakbarSuccessMessage(context, 'Recipe added to favorites');
                            }
                          },
                          icon: Icon(
                            Icons.favorite_rounded,
                            color: isFavorite ? greencolor : lightgreen,
                            size: height * 0.05,
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(child:  myfonts2(recipe.label),),
                ),
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: height * 0.04,
                            width: width * 0.08,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: lightgreen,
                            ),
                            child: Icon(
                              Icons.flatware,
                              size: height * 0.03,
                              color: greencolor,
                            ),
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          myfonts5(recipe.mealType.join('/'))
                        ],
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Row(
                        children: [
                          Container(
                              height: height * 0.04,
                              width: width * 0.08,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: lightgreen,
                              ),
                              child: Icon(
                                Icons.whatshot,
                                size: height * 0.02,
                                color: greencolor,
                              )),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          myfonts5(
                              '${recipe.calories.round().toString()} Calories')
                        ],
                      ),
                    ],
                  ),
                 SizedBox(
                  width: width*0.5,
                 child:    recipe.dietLabels.join().isEmpty
                      ? Container()
                      : myfonts(recipe.dietLabels.join(' ◉ ')),
                 )
                ],
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
                          height: height * 0.085,
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
                          height: height * 0.085,
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
                height: height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: myfonts4(recipe.healthLabels.join('  ◉  ')),
              ),
              SizedBox(
                height: height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
