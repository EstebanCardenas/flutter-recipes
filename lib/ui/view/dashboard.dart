part of flutter.recipes.ui.view;

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);
  static const String route = '/dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
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
                      style: Headings.h4,
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
                          children: <Widget>[
                            MealCard(
                              imgUrl: state.dailyMeal?.imgUrl ?? '',
                              name: state.dailyMeal?.name ?? '',
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'Main Categories',
                              style: Headings.h4,
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
                          children: List.generate(
                            state.categoryMeals?.length ?? 0,
                            (int idx) {
                              Meal meal = state.categoryMeals![idx];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  MealCard(
                                    imgUrl: meal.imgUrl,
                                    name: meal.name,
                                  ),
                                  const SizedBox(height: 16),
                                ],
                              );
                            },
                          ),
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
