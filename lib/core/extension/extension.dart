library flutter.recipes.core.extension;

extension MapExtension on Map<String, dynamic> {
  String getString(String key) {
    return this[key] ?? '';
  }

  int getInt(String key) {
    return int.tryParse(this[key].toString()) ?? 0;
  }

  double getDouble(String key) {
    return double.tryParse(this[key].toString()) ?? 0;
  }

  num getNum(String key) {
    return num.tryParse(this[key].toString()) ?? 0;
  }
}

extension StringExtension on String {
  String get capitalize {
    String firstLetter = this[0];
    return replaceFirst(firstLetter, firstLetter.toUpperCase());
  }
}
