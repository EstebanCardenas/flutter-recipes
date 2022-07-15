part of flutter.recipes.ui.widgets;

class CateogryCard extends StatelessWidget {
  const CateogryCard({
    Key? key,
    required this.isSelected,
    required this.name,
    required this.imgUrl,
    this.onTap,
  }) : super(key: key);

  final bool isSelected;
  final String name;
  final String imgUrl;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 96,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFB661) : Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: const Offset(1, 2),
              blurRadius: 4,
              color: Colors.black.withOpacity(0.25),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(24),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  ClipOval(
                    child: SizedBox.square(
                      dimension: 80,
                      child: ColoredBox(
                        color:
                            isSelected ? Colors.white : const Color(0xFFF1F1F1),
                        child: Image.network(imgUrl),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    name,
                    style: Regular.p.copyWith(
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                    overflow: TextOverflow.clip,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
