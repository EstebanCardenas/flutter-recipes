part of flutter.recipes.ui.view;

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);
  static const String route = '/dashboard';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 22),
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 24),
                    Text(
                      'Meal of the day',
                      style: Bold.h4,
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
              BlocBuilder<DashboardController, DashboardState>(
                builder: (BuildContext blocContext, DashboardState state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 22),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            MealCard(
                              name: state.dailyMeal?.name ?? '',
                              imgUrl: state.dailyMeal?.imgUrl ?? '',
                              dimension: MediaQuery.of(context).size.width - 44,
                              category: state.dailyMeal?.category,
                              onTap: () => Navigator.of(context).pushNamed(
                                RecipeDetail.route,
                                arguments: state.dailyMeal?.id,
                              ),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'Main categories',
                              style: Bold.h4,
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 180,
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 22),
                          scrollDirection: Axis.horizontal,
                          itemCount: state.categories?.length ?? 0,
                          itemBuilder: (_, int idx) {
                            Category current =
                                state.categories?[idx] ?? Category.fromJson({});
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: CateogryCard(
                                isSelected: state.selectedCategory == current,
                                name: current.name,
                                imgUrl: current.imgUrl,
                                onTap: () => blocContext
                                    .read<DashboardController>()
                                    .selectCategory(current),
                              ),
                            );
                          },
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: 16),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.only(left: 22),
                        child: Column(
                          children: state.getCategoryMealsStatus ==
                                  RequestStatus.loading
                              ? [const MealCardShimmer()]
                              : state.getCategoryMealsStatus ==
                                      RequestStatus.done
                                  ? List.generate(
                                      state.categoryMeals?.length ?? 0,
                                      (int idx) {
                                        Meal meal = state.categoryMeals![idx];
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            MealCard(
                                              imgUrl: meal.imgUrl,
                                              name: meal.name,
                                              onTap: () => Navigator.of(context)
                                                  .pushNamed(
                                                RecipeDetail.route,
                                                arguments: meal.id,
                                              ),
                                            ),
                                            const SizedBox(height: 16),
                                          ],
                                        );
                                      },
                                    )
                                  : [],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
