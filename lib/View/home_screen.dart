// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:nutri_fit/Controller/repository.dart';
import 'package:nutri_fit/View/search_view.dart';
import 'package:nutri_fit/View/utils/colour.dart';
import 'package:nutri_fit/View/utils/resposive.dart';
import 'package:nutri_fit/View/widgets/clip_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final recipeprovider= Provider.of<RecipeProvider>(context);
    double height = Responsive.screenHeight(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  height: height * 0.2,
                  width: double.infinity,
                  color: greencolor,
                ),
              ),
              Image.network('https://proveg.com/uk/wp-content/uploads/sites/3/2018/06/Foodplate-3.jpg'),
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
                    // suffixIcon: IconButton(
                    //     onPressed: () {
          
                    //     },
                    //     icon: const Icon(Icons.clear)),
                  ),
                ),
              ),
              recipeprovider.isLoading
              ? const CircularProgressIndicator()
              : Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: recipeprovider.recipes.length,
                  itemBuilder: (context, index) {
                    final recipe= recipeprovider.recipes[index];
                    return ListTile(
                      leading: Image.network(recipe.image),
                      title: Text(recipe.label),
                      trailing: Text(recipe.dietLabels.toString()),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Searchview(recipe: recipe,)));
                      },
                    );
                  },),
              )
            ],
          ),
        ),
      ),
    );
  }
}
