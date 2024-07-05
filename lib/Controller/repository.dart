import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart ' as http;
import 'package:nutri_fit/Controller/debouncer.dart';
import 'package:nutri_fit/Model/recipe_model.dart';
// String apikey= 'c9b7e4d6f8d81608bf8ff357b5479051';
class RecipeProvider with ChangeNotifier{
  List<RecipeModel> recipes = [];
  bool isLoading = false;

  List<RecipeModel> get getrecipes => recipes;
  bool get getisLoading => isLoading;

  final Debouncer debouncer =Debouncer(milliseconds: 500);
Future<void> fetchRecipe(String query) async {
 isLoading=true;
 notifyListeners();
  try {
      var response = await http.get(Uri.parse(
      "https://api.edamam.com/api/recipes/v2?type=public&q=$query&app_id=358f8ce1&app_key=c9b7e4d6f8d81608bf8ff357b5479051"));

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    recipes=[];

    for (var item in data['hits']) {
      RecipeModel recipeModel = RecipeModel.fromJson(item['recipe']);
      recipes.add(recipeModel);
    }
    isLoading=false;
    notifyListeners();
  } else {
    throw Exception('Failed to load recipes');
  }
  } catch (e) {
    throw Exception(e.toString());
  }

}
void searchRecipes( String query) {
  debouncer.run(() async {
     fetchRecipe( query);
  });
}
}
