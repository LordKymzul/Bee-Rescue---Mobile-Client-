import 'package:flutter/material.dart';

class MySizebox {
  static Widget getVerticalSizedBox(double value) {
    return SizedBox(
      height: value,
    );
  }

  static Widget getHorizontalSizedBox(double value) {
    return SizedBox(
      width: value,
    );
  }
}
