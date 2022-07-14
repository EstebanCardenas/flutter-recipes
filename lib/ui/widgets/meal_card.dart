part of flutter.recipes.ui.widgets;

class MealCard extends StatelessWidget {
  const MealCard({
    Key? key,
    required this.name,
    this.dimension = 214,
    required this.imgUrl,
    this.category,
  }) : super(key: key);

  final String name;
  final double dimension;
  final String imgUrl;
  final String? category;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: dimension,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: Headings.h5.copyWith(
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    if (category != null) ...<Widget>[
                      const SizedBox(height: 8),
                      Text(
                        category!,
                        style: Paragraphs.label.copyWith(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
