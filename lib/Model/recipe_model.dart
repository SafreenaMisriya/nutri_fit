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
  final Nutrient saturated;
  final Nutrient trans;
  final Nutrient monounsaturated;
  final Nutrient fiber;
  final Nutrient sugars;
  final Nutrient protein;
  final Nutrient cholesterol;
  final Nutrient sodium;
  final Nutrient calcium;
  final Nutrient magnesium;
  final Nutrient potassium;
  final Nutrient iron;
  final Nutrient zinc;
  final Nutrient phosphorus;
  final Nutrient vitaminA;
  final Nutrient vitaminC;
  final Nutrient thiamin;
  final Nutrient riboflavin;
  final Nutrient niacin;
  final Nutrient vitaminB6;
  final Nutrient folate;
  final Nutrient folicAcid;
  final Nutrient vitaminB12;
  final Nutrient vitaminD;
  final Nutrient vitaminE;
  final Nutrient vitaminK;
  final Nutrient water;

  Nutrients({
    required this.energy,
    required this.fat,
    required this.saturated,
    required this.trans,
    required this.monounsaturated,
    required this.fiber,
    required this.sugars,
    required this.protein,
    required this.cholesterol,
    required this.sodium,
    required this.calcium,
    required this.magnesium,
    required this.potassium,
    required this.iron,
    required this.zinc,
    required this.phosphorus,
    required this.vitaminA,
    required this.vitaminC,
    required this.thiamin,
    required this.riboflavin,
    required this.niacin,
    required this.vitaminB6,
    required this.folate,
    required this.folicAcid,
    required this.vitaminB12,
    required this.vitaminD,
    required this.vitaminE,
    required this.vitaminK,
    required this.water,
  });

  factory Nutrients.fromJson(Map<String, dynamic> json) {
    return Nutrients(
      energy: Nutrient.fromJson(json['ENERC_KCAL']??''),
      fat: Nutrient.fromJson(json['FAT']??''),
      saturated: Nutrient.fromJson(json['FASAT']??''),
      trans: Nutrient.fromJson(json['FATRN']??''),
      monounsaturated: Nutrient.fromJson(json['FAMS']??''),
      fiber: Nutrient.fromJson(json['FIBTG']??''),
      sugars: Nutrient.fromJson(json['SUGAR']??''),
      protein: Nutrient.fromJson(json['PROCNT']??''),
      cholesterol: Nutrient.fromJson(json['CHOLE']?? ''),
      sodium: Nutrient.fromJson(json['NA']??''),
      calcium: Nutrient.fromJson(json['CA']??''),
      magnesium: Nutrient.fromJson(json['MG']??''),
      potassium: Nutrient.fromJson(json['K']??''),
      iron: Nutrient.fromJson(json['FE']??''),
      zinc: Nutrient.fromJson(json['ZN']??''),
      phosphorus: Nutrient.fromJson(json['P']??''),
      vitaminA: Nutrient.fromJson(json['VITA_RAE']??''),
      vitaminC: Nutrient.fromJson(json['VITC']??''),
      thiamin: Nutrient.fromJson(json['THIA']??''),
      riboflavin: Nutrient.fromJson(json['RIBF']??''),
      niacin: Nutrient.fromJson(json['NIA']??''),
      vitaminB6: Nutrient.fromJson(json['VITB6A']??''),
      folate: Nutrient.fromJson(json['FOLDFE']??''),
      folicAcid: Nutrient.fromJson(json['FOLAC']??''),
      vitaminB12: Nutrient.fromJson(json['VITB12']??''),
      vitaminD: Nutrient.fromJson(json['VITD']??''),
      vitaminE: Nutrient.fromJson(json['TOCPHA']??''),
      vitaminK: Nutrient.fromJson(json['VITK1']??''),
      water: Nutrient.fromJson(json['WATER']??''),
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
