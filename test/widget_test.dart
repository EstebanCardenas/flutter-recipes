import 'package:flutter_test/flutter_test.dart';
import 'package:recipes/main.dart';

void main() {
  testWidgets('Recipes app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const RecipesApp());
    expect(find.byType(RecipesApp), findsOneWidget);
  });
}
