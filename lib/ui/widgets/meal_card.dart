part of flutter.recipes.ui.widgets;

class MealCard extends StatelessWidget {
  const MealCard({
    Key? key,
    required this.imgUrl,
    required this.name,
  }) : super(key: key);

  final String imgUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 214,
      height: 214,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            Image.network(
              imgUrl,
            ),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Colors.transparent,
                    Colors.black,
                  ],
                ),
              ),
            ),
            Positioned(
              left: 24,
              bottom: 24,
              child: SizedBox(
                width: 150,
                child: Text(
                  name,
                  style: Headings.h5.copyWith(
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.clip,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
