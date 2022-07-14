part of flutter.recipes.ui.widgets;

class MealCardShimmer extends StatelessWidget {
  const MealCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      direction: ShimmerDirection.ltr,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: const SizedBox.square(
          dimension: 214,
          child: ColoredBox(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
