class RecipeModel {
  final String label;
  final String image;
  final String source;
  final String url;
  final String shareAs;
  final List<String> dietLabels;
  final List<String> healthLabels;
  final List<String> mealType;
  final Nutrients totalNutrients;

  RecipeModel({
    required this.label,
    required this.image,
    required this.source,
    required this.url,
    required this.shareAs,
    required this.dietLabels,
    required this.healthLabels,
    required this.mealType,
    required this.totalNutrients,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      label: json['label'] ?? '',
      image: json['image'] ?? '',
      source: json['source'] ?? '',
      url: json['url'] ?? '',
      shareAs: json['shareAs'] ?? '',
      dietLabels: List<String>.from(json['dietLabels'] ?? []),
      healthLabels: List<String>.from(json['healthLabels'] ?? []),
      mealType: List<String>.from(json['mealType'] ?? []),
      totalNutrients: Nutrients.fromJson(json['totalNutrients'] ?? {}),
    );
  }
}

class Nutrients {
  final Nutrient energy;
  final Nutrient fat;
  final Nutrient fiber;
  final Nutrient protein;
  // final Nutrient cholesterol;
  // final Nutrient sodium;
  final Nutrient calcium;
  final Nutrient vitaminC;

  Nutrients({
    required this.energy,
    required this.fat,
    required this.fiber,
    required this.protein,
    // required this.cholesterol,
    // required this.sodium,
    required this.calcium,
    required this.vitaminC,
  });

  factory Nutrients.fromJson(Map<String, dynamic> json) {
    return Nutrients(
      energy: Nutrient.fromJson(json['ENERC_KCAL']??''),
      fat: Nutrient.fromJson(json['FAT']??''),
      fiber: Nutrient.fromJson(json['FIBTG']??''),
      protein: Nutrient.fromJson(json['PROCNT']??''),
      // cholesterol: Nutrient.fromJson(json['CHOLE']?? ''),
      // sodium: Nutrient.fromJson(json['NA']??''),
      calcium: Nutrient.fromJson(json['CA']??''),
      vitaminC: Nutrient.fromJson(json['VITC']??''),
    );
  }
}

class Nutrient {
  final String label;
  final double quantity;

  Nutrient({
    required this.label,
    required this.quantity,
  });

  factory Nutrient.fromJson(Map<String, dynamic> json) {
    return Nutrient(
      label: json['label'] ?? '',
      quantity: (json['quantity'] as num).toDouble(),
    );
  }
}
