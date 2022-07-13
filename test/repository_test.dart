import 'package:flutter_test/flutter_test.dart';
import 'package:recipes/core/data/data.dart';

void main() {
  test('Get meal categories', () async {
    List<Category> categories = await Repository.getMealCategories();
    expect(categories.length, greaterThan(0));
  });
}
