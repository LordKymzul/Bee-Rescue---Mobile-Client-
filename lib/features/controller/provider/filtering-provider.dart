import 'package:flutter/material.dart';

class FilteringProvider extends ChangeNotifier {
  double _currentValueDistance = 0.0;
  double get currentValueDistance => _currentValueDistance;

  double _currentValueRating = 0.0;
  double get currentValueRating => _currentValueRating;

  void handleDistanceOnChanged(double value) {
    _currentValueDistance = value;
    notifyListeners();
  }

  void handleRatingOnChanged(double value) {
    print(value);
    _currentValueRating = value;
    notifyListeners();
  }

  void handleReset() {
    _currentValueDistance = 0.0;
    _currentValueRating = 0.0;
    notifyListeners();
  }
}
