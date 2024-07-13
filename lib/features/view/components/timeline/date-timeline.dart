import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/style/mytext-style.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';

import '../../../../shared/constant/size-constant.dart';

class DateTimeline extends StatelessWidget {
  final void Function(DateTime)? onDateChange;

  const DateTimeline({super.key, required this.onDateChange});

  List<DateTime> _generateWeekendDates(DateTime start, DateTime end) {
    List<DateTime> weekends = [];
    DateTime current = start;

    while (current.isBefore(end)) {
      if (current.weekday == DateTime.saturday ||
          current.weekday == DateTime.sunday) {
        weekends.add(current);
      }
      current = current.add(const Duration(days: 1));
    }

    return weekends;
  }

  @override
  Widget build(BuildContext context) {
    return buildDateTimeline(context);
  }

  DatePicker buildDateTimeline(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime yearEnd = DateTime(now.year, 12, 31); // End of the current year
    List<DateTime> inactiveDates = _generateWeekendDates(now, yearEnd);

    if (now.weekday == DateTime.saturday || now.weekday == DateTime.sunday) {
      inactiveDates.add(now);
    }

    return DatePicker(
      now,
      height: 100,
      width: 80,
      initialSelectedDate: now,
      dateTextStyle: MyTextStyle.getTitleStyle(
          context, SizeConstant.fontSizeXlg, context.onBackgroundColor),
      dayTextStyle: MyTextStyle.getTitleStyle(
          context, SizeConstant.fontSizeSm, context.onBackgroundColor),
      monthTextStyle: MyTextStyle.getTitleStyle(
          context, SizeConstant.fontSizeSm, context.onBackgroundColor),
      selectionColor: context.primaryColor,
      selectedTextColor: context.onPrimaryColor,
      deactivatedColor: context.greyColor,
      onDateChange: onDateChange,
      inactiveDates: inactiveDates,
    );
  }
}
