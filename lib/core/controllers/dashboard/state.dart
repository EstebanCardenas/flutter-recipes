part of flutter.recipes.core.controllers.dashboard;

class DashboardState {
  DashboardState({
    this.dailyMeal,
    this.categories,
    this.selectedCategory,
    this.categoryMeals,
    this.dashboardLoadStatus,
    this.getCategoryMealsStatus = RequestStatus.done,
  });

  final MealDetail? dailyMeal;
  final List<Category>? categories;
  final Category? selectedCategory;
  final List<Meal>? categoryMeals;

  /// statuses
  final RequestStatus? dashboardLoadStatus;
  final RequestStatus? getCategoryMealsStatus;

  DashboardState copyWith({
    MealDetail? dailyMeal,
    List<Category>? categories,
    Category? selectedCategory,
    List<Meal>? categoryMeals,
    RequestStatus? dashboardLoadStatus,
    RequestStatus? getCategoryMealsStatus,
  }) {
    return DashboardState(
      dailyMeal: dailyMeal ?? this.dailyMeal,
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      categoryMeals: categoryMeals ?? this.categoryMeals,
      dashboardLoadStatus: dashboardLoadStatus ?? this.dashboardLoadStatus,
      getCategoryMealsStatus:
          getCategoryMealsStatus ?? this.getCategoryMealsStatus,
    );
  }
}
