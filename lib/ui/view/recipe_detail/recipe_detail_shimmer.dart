part of flutter.recipes.ui.view;

class RecipeDetailShimmer extends StatelessWidget {
  const RecipeDetailShimmer({Key? key}) : super(key: key);

  Widget _box({
    required double width,
    required double height,
  }) =>
      SizedBox(
        width: width,
        height: height,
        child: const ColoredBox(color: Colors.white),
      );

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
            _box(width: 244, height: 29),
            const Padding(padding: EdgeInsets.symmetric(vertical: 2)),
            _box(width: 48, height: 29),
            const Padding(padding: EdgeInsets.symmetric(vertical: 6)),
            _box(width: double.infinity, height: 220),
            const Padding(padding: EdgeInsets.symmetric(vertical: 6)),
            _box(width: 144, height: 28),
            const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
            Expanded(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (_, __) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _box(width: double.infinity, height: 76),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
