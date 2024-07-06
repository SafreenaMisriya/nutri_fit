import 'package:flutter/material.dart';
import 'package:nutri_fit/Controller/database.dart';

import 'package:nutri_fit/View/screens/search_view.dart';
import 'package:nutri_fit/View/utils/colour.dart';
import 'package:nutri_fit/View/utils/fonts.dart';
import 'package:nutri_fit/View/utils/resposive.dart';
import 'package:nutri_fit/View/widgets/favourte_appbar.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../Model/recipe_model.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = Responsive.screenHeight(context);
    var favoriteProvider = Provider.of<FavoriteProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: customfavappbar(context),
        body: Column(
          children: [
            SizedBox(
              height: height * 0.01,
            ),
            Consumer<FavoriteProvider>(
              builder: (context, provider, child) {
                List<RecipeModel> favorites = provider.list;
                return favorites.isEmpty
                    ? Center(
                        child: Shimmer.fromColors(
                          baseColor: greencolor,
                          highlightColor: whitecolor,
                          child: const Text(
                            'No Data Available',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      )
                    : Flexible(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: favorites.length,
                          itemBuilder: (context, index) {
                            final recipe = favorites[index];
                            return Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: greencolor,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: lightgreen),
                                    ),
                                    height: height * 0.1,
                                    child: ListTile(
                                      leading: ClipOval(
                                        child: Image.network(recipe.image),
                                      ),
                                      title: myfonts3(recipe.label),
                                      subtitle: Text(
                                        recipe.dietLabels.join(' ❁ '),
                                        style: TextStyle(color: lightgreen),
                                      ),
                                      trailing: IconButton(
                                        onPressed: () {
                                          favoriteProvider.removeFavorite(recipe);
                                        },
                                        icon: Icon(
                                          Icons.favorite,
                                          size: height * 0.03,
                                          color: lightgreen,
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Searchview(
                                              recipe: recipe,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
