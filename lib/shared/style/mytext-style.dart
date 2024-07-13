import 'package:flutter/material.dart';

class MyTextStyle {
  static TextStyle getTitleStyle(
      BuildContext context, double fontsize, Color color) {
    return TextStyle(
        fontSize: fontsize, color: color, fontWeight: FontWeight.w500);
  }

  static TextStyle getSubTitleStyle(
      BuildContext context, double fontsize, Color color) {
    return TextStyle(
        fontSize: fontsize, color: color, fontWeight: FontWeight.w300);
  }
}
