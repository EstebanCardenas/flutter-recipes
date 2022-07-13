part of flutter.recipes.core.data.schema;

class Category {
  final int id;
  final String name;
  final String imgUrl;
  final String description;

  Category({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.description,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json.getInt('idCategory'),
      name: json.getString('strCategory'),
      imgUrl: json.getString('strCategoryThumb'),
      description: json.getString('strCategoryDescription'),
    );
  }
}
