part of flutter.recipes.core.controllers.dashboard;

class DashboardController extends Cubit<DashboardState> with ControllerMixin {
  DashboardController() : super(DashboardState());

  void selectCategory(Category selected) {
    emit(
      state.copyWith(selectedCategory: selected),
    );
  }

  Future<void> getDashboard(BuildContext context) async {
    try {
      displayLoading(context);
      List<dynamic> data = await Future.wait([
        Repository.getRandomMeal(),
        Repository.getMealCategories(),
      ]);
      MealDetail dailyMeal = data.first;
      List<Category> categories = data.last;
      Category selectedCategory = categories.first;
      List<Meal> categoryMeals =
          await Repository.getMealsFromCategory(selectedCategory.name);
      closeLoading();
      emit(
        state.copyWith(
          categories: categories,
          dailyMeal: dailyMeal,
          selectedCategory: selectedCategory,
          categoryMeals: categoryMeals,
          dashboardLoadError: false,
        ),
      );
    } on Exception {
      closeLoading();
      emit(
        state.copyWith(dashboardLoadError: true),
      );
    }
  }
}
