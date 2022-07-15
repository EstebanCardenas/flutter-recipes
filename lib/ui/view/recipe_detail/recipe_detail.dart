part of flutter.recipes.ui.view;

class RecipeDetail extends StatelessWidget {
  const RecipeDetail({Key? key}) : super(key: key);
  static const String route = '/dashboard/recipe-detail';

  @override
  Widget build(BuildContext context) {
    final int mealId = ModalRoute.of(context)!.settings.arguments as int;
    return BlocProvider(
      create: (_) => RecipeDetailController(mealId),
      child: const RecipeDetailView(),
    );
  }
}

class RecipeDetailView extends StatefulWidget {
  const RecipeDetailView({Key? key}) : super(key: key);

  @override
  State<RecipeDetailView> createState() => _RecipeDetailViewState();
}

class _RecipeDetailViewState extends State<RecipeDetailView> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    context.read<RecipeDetailController>().getMealDetail();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RecipeDetailController, RecipeDetailState>(
      listenWhen: (RecipeDetailState prev, RecipeDetailState current) =>
          prev != current,
      listener: (BuildContext listenerContext, RecipeDetailState state) {
        if (state.detailStatus == RequestStatus.done) {
          controller = YoutubePlayerController(
            initialVideoId: state.videoId,
            flags: const YoutubePlayerFlags(
              autoPlay: false,
            ),
          );
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: BlocBuilder<RecipeDetailController, RecipeDetailState>(
            builder: (BuildContext context, RecipeDetailState state) => state
                        .detailStatus ==
                    RequestStatus.loading
                ? const RecipeDetailShimmer()
                : state.detailStatus == RequestStatus.done
                    ? YoutubePlayerBuilder(
                        player: YoutubePlayer(
                          controller: state.mealDetail!.videoUrl.isNotEmpty
                              ? controller
                              : YoutubePlayerController(
                                  initialVideoId: '',
                                ),
                        ),
                        builder: (BuildContext playerContext, Widget player) =>
                            SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 22),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(height: 12),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  alignment: Alignment.centerLeft,
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Color(0xFF303030),
                                  ),
                                  onPressed: Navigator.of(context).pop,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'How to make ${state.loweredMealName}',
                                  style: Bold.h4,
                                ),
                                const SizedBox(height: 24),
                                if (state.mealDetail!.videoUrl.isNotEmpty)
                                  player
                                else if (state.mealDetail!.imgUrl.isNotEmpty)
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(24),
                                    child:
                                        Image.network(state.mealDetail!.imgUrl),
                                  ),
                                const SizedBox(height: 24),
                                if (state.mealDetail!.ingredients
                                    .isNotEmpty) ...<Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Ingredients',
                                        style: Bold.h5,
                                      ),
                                      Text(
                                        state.ingredientLength,
                                        style: Regular.label.copyWith(
                                          color: const Color(0xFFA9A9A9),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  ...List<Widget>.generate(
                                    state.mealDetail!.ingredients.length,
                                    (int idx) {
                                      MapEntry item = state
                                          .mealDetail!.ingredients.entries
                                          .toList()[idx];
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: IngredientCard(
                                          name: item.key,
                                          measure: item.value,
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                ],
                                Text(
                                  'Instructions',
                                  style: Bold.h5,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  state.mealDetail!.instructions,
                                  style: Regular.p,
                                ),
                                const SizedBox(height: 16),
                              ],
                            ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
