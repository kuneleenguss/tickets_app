import 'package:flutter/material.dart';

class AppThemes {
  static final buttonTransparentTheme = ButtonStyle(
    padding: MaterialStateProperty.all(EdgeInsets.zero),
    backgroundColor: MaterialStateProperty.all(Colors.transparent),
    shadowColor: MaterialStateProperty.all(Colors.transparent),
    surfaceTintColor: MaterialStateProperty.all(Colors.transparent),
  );
}
