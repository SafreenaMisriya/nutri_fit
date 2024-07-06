
class RecipeModel {
  final String label;
  final String image;
  final String url;
  final String shareAs;
  final double calories;
  final List<String> dietLabels;
  final List<String> healthLabels;
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
      calories: json['calories']??0.0,
      dietLabels: List<String>.from(json['dietLabels'] ?? []),
      healthLabels: List<String>.from(json['healthLabels'] ?? []),
      mealType: List<String>.from(json['mealType'] ?? []),
    
    );
  }
}

