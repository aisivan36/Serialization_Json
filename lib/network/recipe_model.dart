import 'package:json_annotation/json_annotation.dart';

part 'recipe_model.g.dart';

/// Marks with [@JsonSerializable()] class as [serializable]
/// so the [json_serializable] package can generate the [.g.dart] file
@JsonSerializable()
class APIRecipeQuery {
  APIRecipeQuery({
    required this.query,
    required this.from,
    required this.to,
    required this.more,
    required this.count,
    required this.hits,
  });

  @JsonKey(name: 'q')
  String query;
  int from;
  int to;
  bool more;
  int count;
  List<APIHits> hits;

  ///
  ///
  factory APIRecipeQuery.fromJson(Map<String, dynamic> json) =>
      _$APIRecipeQueryFromJson(json);

  Map<String, dynamic> toJson() => _$APIRecipeQueryToJson(this);
}

/// Marks the class [serializable]
@JsonSerializable()
class APIHits {
  APIRecipe recipe;

  APIHits({
    required this.recipe,
  });

  /// Methods for [JSON] serialization
  factory APIHits.fromJson(Map<String, dynamic> json) =>
      _$APIHitsFromJson(json);
  Map<String, dynamic> toJson() => _$APIHitsToJson(this);
}

////
////
////
////
////
@JsonSerializable()
class APIRecipe {
  /// Define the fields for a recipe
  /// Label is the text shown and image is URL of the image to show
  String label;
  String image;
  String url;

  /// State that each recipe has a list of ingredients
  List<APIIngredients> ingredients;
  double calories;
  double totalWeight;
  double totalTime;

  APIRecipe({
    required this.label,
    required this.image,
    required this.url,
    required this.ingredients,
    required this.calories,
    required this.totalWeight,
    required this.totalTime,
  });

  /// Create the factory methods for serializing JSON
  factory APIRecipe.fromJson(Map<String, dynamic> json) =>
      _$APIRecipeFromJson(json);
  Map<String, dynamic> toJson() => _$APIRecipeToJson(this);

  /// Helper method to turn calorie into a String
  String getCalories(double? calories) {
    if (calories == null) {
      return '0 KCAL';
    }
    return calories.floor().toString() + ' KCAL';
  }

  /// Helper method to turn weight into a String
  String getWeight(double? weight) {
    if (weight == null) {
      return '0g';
    }
    return weight.floor().toString() + 'g';
  }
}

@JsonSerializable()
class APIIngredients {
  /// State that the name field of this class maps to the JSON field named text
  @JsonKey(name: 'text')
  String name;
  double weight;

  APIIngredients({
    required this.name,
    required this.weight,
  });

  /// Create the methods to serialize JSON
  factory APIIngredients.fromJson(Map<String, dynamic> json) =>
      _$APIIngredientsFromJson(json);
  Map<String, dynamic> toSjon() => _$APIIngredientsToJson(this);
}
