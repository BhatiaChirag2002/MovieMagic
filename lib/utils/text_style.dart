import 'package:flutter/material.dart';

class CustomTextStyle {
  static TextStyle protestRiot(
      {required double fontSize,
      required Color color,
      FontWeight fontWeight = FontWeight.w900}) {
    return TextStyle(
        fontFamily: 'ProtestRiot',
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        wordSpacing: 5);
  }

  static TextStyle robotoRegular(
      {required double fontSize,
      required Color color,
      FontWeight fontWeight = FontWeight.w400}) {
    return TextStyle(
        fontFamily: 'Roboto-Regular',
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        wordSpacing: 2);
  }
}
