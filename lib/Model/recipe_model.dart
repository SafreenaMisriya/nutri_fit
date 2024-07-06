import 'package:hive/hive.dart';
part 'recipe_model.g.dart';
@HiveType(typeId: 1)
class RecipeModel {
  @HiveField(0)
  final String label;
  @HiveField(1)
  final String image;
  @HiveField(2)
  final String url;
  @HiveField(3)
  final String shareAs;
  @HiveField(4)
  final double calories;
  @HiveField(5)
  final List<String> dietLabels;
  @HiveField(6)
  final List<String> healthLabels;
  @HiveField(7)
  final List<String> mealType;

  RecipeModel({
    required this.label,
    required this.image,
    required this.url,
    required this.shareAs,
    required this.calories,
    required this.dietLabels,
    required this.healthLabels,
    required this.mealType,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      label: json['label'] ?? '',
      image: json['image'] ?? '',
      url: json['url'] ?? '',
      shareAs: json['shareAs'] ?? '',
      calories: json['calories'] ?? 0.0,
      dietLabels: List<String>.from(json['dietLabels'] ?? []),
      healthLabels: List<String>.from(json['healthLabels'] ?? []),
      mealType: List<String>.from(json['mealType'] ?? []),
    );
  }
}
