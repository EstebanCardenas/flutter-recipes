part of flutter.recipes.core.controllers.dashboard;

class RecipeDetailState {
  RecipeDetailState({
    required this.mealId,
    this.mealDetail,
    this.detailStatus,
  });

  final int mealId;
  final MealDetail? mealDetail;

  /// statuses
  final RequestStatus? detailStatus;

  String get videoId => mealDetail != null
      ? Uri.parse(mealDetail!.videoUrl).queryParameters['v']!
      : '';

  String get loweredMealName => mealDetail?.name.toLowerCase() ?? '';

  String get ingredientLength {
    int length = mealDetail?.ingredients.length ?? 0;
    String value = '$length item';
    if (length > 1) {
      value += 's';
    }
    return value;
  }

  RecipeDetailState copyWith({
    MealDetail? mealDetail,
    RequestStatus? detailStatus,
  }) =>
      RecipeDetailState(
        mealId: mealId,
        mealDetail: mealDetail ?? this.mealDetail,
        detailStatus: detailStatus ?? this.detailStatus,
      );
}
