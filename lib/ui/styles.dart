import 'package:flutter/material.dart';

class Headings {
  static const TextStyle _base = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static final TextStyle bold = _base.copyWith(
    fontSize: 56,
    height: 67.2 / 56,
  );
  static final TextStyle h1 = _base.copyWith(
    fontSize: 48,
    height: 57.6 / 48,
  );
  static final TextStyle h2 = _base.copyWith(
    fontSize: 40,
    height: 48 / 40,
  );
  static final TextStyle h3 = _base.copyWith(
    fontSize: 32,
    height: 38.4 / 32,
  );
  static final TextStyle h4 = _base.copyWith(
    fontSize: 24,
    height: 28.8 / 24,
  );
  static final TextStyle h5 = _base.copyWith(
    fontSize: 20,
    height: 28 / 20,
  );
  static final TextStyle p = _base.copyWith(
    fontSize: 16,
    height: 22.4 / 16,
  );
}

class Paragraphs {
  static const TextStyle _base = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  static final TextStyle heading = _base.copyWith(
    fontSize: 56,
    height: 67.2 / 56,
  );
  static final TextStyle h1 = _base.copyWith(
    fontSize: 48,
    height: 57.6 / 48,
  );
  static final TextStyle h2 = _base.copyWith(
    fontSize: 40,
    height: 48 / 40,
  );
  static final TextStyle h3 = _base.copyWith(
    fontSize: 32,
    height: 38.4 / 32,
  );
  static final TextStyle h4 = _base.copyWith(
    fontSize: 24,
    height: 28.8 / 24,
  );
  static final TextStyle h5 = _base.copyWith(
    fontSize: 20,
    height: 28 / 20,
  );
  static final TextStyle p = _base.copyWith(
    fontSize: 16,
    height: 22.4 / 16,
  );
  static final TextStyle label = _base.copyWith(
    fontSize: 14,
    height: 19.6 / 14,
  );
}
