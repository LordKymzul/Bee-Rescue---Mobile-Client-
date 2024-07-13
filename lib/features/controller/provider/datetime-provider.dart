import 'package:flutter/material.dart';

class DateTimeProvider extends ChangeNotifier {
  int _dayTime = DateTime.now().weekday;
  int get dayTime => _dayTime;

  void selectDayTime(DateTime currentDayTime) {
    print(currentDayTime.weekday);
    _dayTime = currentDayTime.weekday;
    notifyListeners();
  }
}
