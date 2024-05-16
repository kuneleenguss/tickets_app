import 'package:flutter/material.dart';

class AppTypography {
  AppTypography(this.color);
  final Color color;

  TextStyle get tabText => TextStyle(
      fontFamily: "SFProDisplay",
      fontWeight: FontWeight.normal,
      fontSize: 10,
      height: 1.1,
      color: color);

  TextStyle get title1 => TextStyle(
      fontFamily: "SFProDisplay",
      fontWeight: FontWeight.w600,
      fontSize: 22,
      color: color);

  TextStyle get title2 => TextStyle(
      fontFamily: "SFProDisplay",
      fontWeight: FontWeight.w600,
      fontSize: 20,
      height: 1.2,
      color: color);

  TextStyle get title3 => TextStyle(
      fontFamily: "SFProDisplay",
      fontWeight: FontWeight.w600,
      fontSize: 16,
      height: 1.2,
      color: color);

  TextStyle get title4 => TextStyle(
      fontFamily: "SFProDisplay",
      fontWeight: FontWeight.w400,
      fontSize: 14,
      fontStyle: FontStyle.italic,
      height: 1.2,
      color: color);    

  TextStyle get text2 => TextStyle(
      fontFamily: "SFProDisplay",
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 1.2,
      color: color);

  TextStyle get butonText1 => TextStyle(
      fontFamily: "SFProDisplay",
      fontWeight: FontWeight.w600,
      fontSize: 16,
      height: 1.3,
      color: color);
}
