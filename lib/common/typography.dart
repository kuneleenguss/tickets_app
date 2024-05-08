import 'package:flutter/material.dart';
import 'package:tickets_app/common/colors.dart';

class AppTypography {
  AppTypography(this.color);
  final Color color;

  TextStyle get title1 => TextStyle(
      fontFamily: "SFProDisplay",
      fontWeight: FontWeight.w600,
      fontSize: 22,
      color: color);

  TextStyle get title2 => TextStyle(
      fontFamily: "SFProDisplay",
      fontWeight: FontWeight.w600,
      fontSize: 20,
      color: color);

  TextStyle get butonText1 => TextStyle(
      fontFamily: "SFProDisplay",
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: color);
}
