part of flutter.recipes.core.data.schema;

class MealDetail {
  MealDetail({
    required this.id,
    required this.name,
    required this.area,
    required this.instructions,
    required this.imgUrl,
    required this.videoUrl,
    required this.ingredients,
    required this.sourceUrl,
  });

  final int id;
  final String name;
  final String area;
  final String instructions;
  final String imgUrl;
  final String videoUrl;
  final Map<String, String> ingredients;
  final String sourceUrl;

  factory MealDetail.fromJson(Map<String, dynamic> json) {
    final Map<String, String> ingredients = <String, String>{};
    for (int i = 0; i < 20; i++) {
      String key = json.getString('strIngredient1${i + 1}');
      if (key.isNotEmpty) {
        String value = json.getString('strMeasure${i + 1}');
        ingredients.addEntries([MapEntry(key, value)]);
      }
    }
    return MealDetail(
      id: json.getInt('idMeal'),
      name: json.getString('strMeal'),
      area: json.getString('strArea'),
      instructions: json.getString('strInstructions'),
      imgUrl: json.getString('strMealThumb'),
      videoUrl: json.getString('strYoutube'),
      ingredients: ingredients,
      sourceUrl: json.getString('strSource'),
    );
  }
}
