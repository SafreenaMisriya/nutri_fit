
import 'package:hive/hive.dart';
import 'package:nutri_fit/Model/recipe_model.dart';
import 'package:flutter/material.dart';
class FavoriteProvider extends ChangeNotifier {
  List<RecipeModel> list = [];

  Future<void> addFavorite(RecipeModel recipe) async {
    var box = await Hive.openBox<RecipeModel>('favorites');
    var recipes = box.values.where((element) => element.url == recipe.url).toList();
    if (recipes.isEmpty) {
      await box.add(recipe);
      list.add(recipe); 
      notifyListeners();
    }
    await box.close(); 
  }

  Future<void> removeFavorite(RecipeModel recipe) async {
    var box = await Hive.openBox<RecipeModel>('favorites');
    var recipes = box.values.where((element) => element.url == recipe.url).toList();
    if (recipes.isNotEmpty) {
      var key = box.keys.firstWhere((key) => box.get(key)!.url == recipe.url);
      await box.delete(key);
      list.removeWhere((element) => element.url == recipe.url); 
      notifyListeners();
    }
    await box.close(); 
  }

  Future<List<RecipeModel>> getFavoriteRecipes() async {
    var box = await Hive.openBox<RecipeModel>('favorites');
    List<RecipeModel> favorites = box.values.toList();
    await box.close(); 
    list = favorites; 
    notifyListeners();
    return favorites;
  }
}
