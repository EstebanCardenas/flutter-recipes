part of flutter.recipes.core.controllers.dashboard;

class RecipeDetailController extends Cubit<RecipeDetailState>
    with ControllerMixin {
  RecipeDetailController(
    int mealId,
  ) : super(
          RecipeDetailState(
            mealId: mealId,
          ),
        );

  Future<void> getMealDetail() async {
    try {
      emit(state.copyWith(detailStatus: RequestStatus.loading));
      MealDetail detail = await Repository.getMealDetail(state.mealId);
      emit(
        state.copyWith(
          detailStatus: RequestStatus.done,
          mealDetail: detail,
        ),
      );
    } on Exception {
      emit(state.copyWith(detailStatus: RequestStatus.error));
    }
  }
}
