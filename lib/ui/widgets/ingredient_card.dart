part of flutter.recipes.ui.widgets;

class IngredientCard extends StatelessWidget {
  const IngredientCard({
    Key? key,
    required this.name,
    required this.measure,
  }) : super(key: key);

  final String name;
  final String measure;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              name,
              style: Bold.p,
            ),
            Text(
              measure,
              style: Regular.label.copyWith(
                color: const Color(0xFFA9A9A9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
