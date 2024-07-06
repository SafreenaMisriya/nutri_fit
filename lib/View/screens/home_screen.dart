// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:nutri_fit/Controller/repository.dart';
import 'package:nutri_fit/View/screens/favorites.dart';
import 'package:nutri_fit/View/screens/search_view.dart';
import 'package:nutri_fit/View/utils/colour.dart';
import 'package:nutri_fit/View/utils/fonts.dart';
import 'package:nutri_fit/View/utils/resposive.dart';
import 'package:nutri_fit/View/widgets/clip_widget.dart';
import 'package:nutri_fit/View/widgets/shimmerlistview.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final recipeprovider = Provider.of<RecipeProvider>(context);
    double height = Responsive.screenHeight(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(children: [
                ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    height: height * 0.2,
                    width: double.infinity,
                    color: greencolor,
                  ),
                ),
                Positioned(
                    left: 30, top: 25, child: heading('N u t r i   F i t')),
                Positioned(
                    right: 30,
                    top: 25,
                    child: IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: whitecolor,
                        size: height * 0.04,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FavoriteScreen()));
                      },
                    ))
              ]),
              ClipOval(
                  child: Image.network(
                      'https://proveg.com/uk/wp-content/uploads/sites/3/2018/06/Foodplate-3.jpg')),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: controller,
                  onChanged: (value) {
                    recipeprovider.searchRecipes(value);
                  },
                  cursorColor: greycolor,
                  decoration: InputDecoration(
                    fillColor: whitecolor,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: greencolor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: greencolor),
                    ),
                    hintText: 'Search recipe, Food...',
                    hintStyle: TextStyle(
                      color: greencolor,
                    ),
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: TextButton(
                        onPressed: () {
                          recipeprovider.searchRecipes(controller.text);
                        },
                        child: myfonts2('Search')),
                  ),
                ),
              ),
              recipeprovider.isLoading
                  ? shimmerListView()
                  : recipeprovider.recipes.isEmpty
                      ? Center(
                          child: Shimmer.fromColors(
                              baseColor: greencolor,
                              highlightColor: whitecolor,
                              child: const Text(
                                'No Data Available',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w300),
                              )))
                      : Flexible(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: recipeprovider.recipes.length,
                            itemBuilder: (context, index) {
                              final recipe = recipeprovider.recipes[index];
                              return Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: greencolor),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: lightgreen)),
                                      height: height * 0.1,
                                      child: ListTile(
                                        leading: ClipOval(
                                            child: Image.network(recipe.image)),
                                        title: myfonts3(recipe.label),
                                        subtitle: Text(
                                          recipe.dietLabels.join(' ❁ '),
                                          style: TextStyle(color: lightgreen),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Searchview(
                                                        recipe: recipe,
                                                      )));
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
            ],
          ),
        ),
      ),
    );
  }
}
