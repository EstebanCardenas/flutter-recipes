part of flutter.recipes.core.controllers.dashboard;

class DashboardController extends Cubit<DashboardState> with ControllerMixin {
  DashboardController() : super(DashboardState());

  Future<void> selectCategory(Category selected) async {
    emit(
      state.copyWith(
        selectedCategory: selected,
        getCategoryMealsStatus: RequestStatus.loading,
      ),
    );
    List<Meal> categoryMeals =
        await Repository.getMealsFromCategory(selected.name);
    emit(
      state.copyWith(
        categoryMeals: categoryMeals,
        getCategoryMealsStatus: RequestStatus.done,
      ),
    );
  }

  Future<void> getDashboard(BuildContext context) async {
    try {
      emit(
        state.copyWith(
          dashboardLoadStatus: RequestStatus.loading,
        ),
      );
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
          dashboardLoadStatus: RequestStatus.done,
        ),
      );
    } on Exception {
      closeLoading();
      emit(
        state.copyWith(dashboardLoadStatus: RequestStatus.error),
      );
    }
  }
}
