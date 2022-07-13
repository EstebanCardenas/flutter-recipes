part of flutter.recipes.core.data;

class Repository {
  Repository._();

  static Future<List<Category>> getMealCategories() async {
    http.Response response = await http.get(Uri.parse(kMealCategoriesUrl));
    List<dynamic> categoryList = jsonDecode(response.body)['categories'];
    return List<Category>.generate(
      categoryList.length,
      (int idx) => Category.fromJson(categoryList[idx] as Map<String, dynamic>),
    );
  }

  static Future<MealDetail> getRandomMeal() async {
    http.Response response = await http.get(Uri.parse(kRandomMealUrl));
    return MealDetail.fromJson(jsonDecode(response.body)['meals'][0]);
  }

  static Future<List<Meal>> getMealsFromCategory(String categoryName) async {
    http.Response response = await http.get(
      Uri.parse('$kFilterUrl?c=$categoryName'),
    );
    List<dynamic> meals = jsonDecode(response.body)['meals'];
    return List<Meal>.generate(
      meals.length,
      (int idx) => Meal.fromJson(meals[idx] as Map<String, dynamic>),
    );
  }
}
