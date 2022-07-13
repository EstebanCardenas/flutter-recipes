part of flutter.recipes.core.controllers.dashboard;

class DashboardState {
  DashboardState({
    this.dailyMeal,
    this.categories,
    this.selectedCategory,
    this.categoryMeals,
    this.dashboardLoadError,
  });

  final MealDetail? dailyMeal;
  final List<Category>? categories;
  final Category? selectedCategory;
  final List<Meal>? categoryMeals;
  final bool? dashboardLoadError;

  DashboardState copyWith({
    MealDetail? dailyMeal,
    List<Category>? categories,
    Category? selectedCategory,
    List<Meal>? categoryMeals,
    bool? dashboardLoadError,
  }) {
    return DashboardState(
      dailyMeal: dailyMeal ?? this.dailyMeal,
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      categoryMeals: categoryMeals ?? this.categoryMeals,
      dashboardLoadError: dashboardLoadError ?? this.dashboardLoadError,
    );
  }
}
