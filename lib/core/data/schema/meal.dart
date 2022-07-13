part of flutter.recipes.core.data.schema;

class Meal {
  Meal({
    required this.id,
    required this.name,
    required this.imgUrl,
  });

  final int id;
  final String name;
  final String imgUrl;

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json.getInt('idMeal'),
      name: json.getString('strMeal'),
      imgUrl: json.getString('strMealThumb'),
    );
  }
}
