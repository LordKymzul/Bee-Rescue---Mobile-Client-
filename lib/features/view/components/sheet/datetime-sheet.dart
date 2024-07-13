import 'package:beerescue_mobile/features/controller/provider/datetime-provider.dart';
import 'package:beerescue_mobile/features/view/components/chip/select-chip.dart';
import 'package:beerescue_mobile/features/view/components/timeline/date-timeline.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../shared/constant/size-constant.dart';
import '../../../../shared/style/mytext-style.dart';
import '../../../../shared/utils/mysizebox.dart';
import '../chip/sheet-chip.dart';

class DateTimeSheet extends StatelessWidget {
  DateTimeSheet({super.key});

  List<Map<String, dynamic>> listAvailableTime = [
    {
      "day": "Monday",
      "dayTime": 1,
      "times": [
        {"time": "9:00 - 12:00"},
        {"time": "13:00 - 17:00"},
        {"time": "18:00 - 21:00"}
      ],
      "isExpanded": false,
      "isAvailable": true
    },
    {
      "day": "Tuesday",
      "dayTime": 2,
      "times": [
        {"time": "8:00 - 11:00"},
        {"time": "12:00 - 15:00"},
        {"time": "16:00 - 19:00"}
      ],
      "isExpanded": false,
      "isAvailable": true
    },
    {
      "day": "Wednesday",
      "dayTime": 3,
      "times": [
        {"time": "10:00 - 13:00"},
        {"time": "14:00 - 17:00"},
        {"time": "18:00 - 21:00"}
      ],
      "isExpanded": false,
      "isAvailable": true
    },
    {
      "day": "Thursday",
      "dayTime": 4,
      "times": [
        {"time": "9:00 - 12:00"},
        {"time": "13:00 - 17:00"},
        {"time": "18:00 - 21:00"}
      ],
      "isExpanded": false,
      "isAvailable": true
    },
    {
      "day": "Friday",
      "dayTime": 5,
      "times": [
        {"time": "8:00 - 11:00"},
        {"time": "12:00 - 15:00"},
        {"time": "16:00 - 19:00"}
      ],
      "isExpanded": false,
      "isAvailable": true
    },
    {
      "day": "Saturday",
      "dayTime": 6,
      "times": [
        /*  {"time": "10:00 - 13:00"},
        {"time": "14:00 - 17:00"},
        {"time": "18:00 - 21:00"}*/
      ],
      "isExpanded": false,
      "isAvailable": false
    },
    {
      "day": "Sunday",
      "dayTime": 7,
      "times": [
        /*  {"time": "9:00 - 12:00"},
        {"time": "13:00 - 17:00"},
        {"time": "18:00 - 21:00"}*/
      ],
      "isExpanded": false,
      "isAvailable": false
    },
  ];

  void handleDateTimeChange(BuildContext context, DateTime currentDayTime) {
    Provider.of<DateTimeProvider>(context, listen: false)
        .selectDayTime(currentDayTime);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DateTimeProvider>(
      builder: (context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
            const Center(child: SheetChip()),
            MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
            buildHeader(context),
            MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
            buildDateContainer(context),
            MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
            buildTimeContainer(context, value.dayTime)
          ],
        );
      },
    );
  }

  Widget buildHeader(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizeConstant.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date & Time',
              style: MyTextStyle.getTitleStyle(
                  context, SizeConstant.fontSizeLg, context.onBackgroundColor),
            ),
            MySizebox.getVerticalSizedBox(SizeConstant.spaceSm),
            Text(
              'Choose your date and time hive.',
              style: MyTextStyle.getSubTitleStyle(
                  context, SizeConstant.fontSizeSm, context.onBackgroundColor),
            )
          ],
        ),
      );

  Widget buildDateContainer(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: SizeConstant.fontSizeMd),
            child: Text(
              'Day',
              style: MyTextStyle.getTitleStyle(
                  context, SizeConstant.fontSizeMd, context.onBackgroundColor),
            ),
          ),
          MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
          DateTimeline(
            onDateChange: (p0) {
              handleDateTimeChange(context, p0);
            },
          )
        ],
      );
  Widget buildTimeContainer(BuildContext context, int dayTime) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: SizeConstant.fontSizeMd),
            child: Text(
              'Time',
              style: MyTextStyle.getTitleStyle(
                context,
                SizeConstant.fontSizeMd,
                context.onBackgroundColor,
              ),
            ),
          ),
          MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
          buildListTime(dayTime)
        ],
      );

  Widget buildListTime(int dayTime) => SizedBox(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listAvailableTime.length,
          itemBuilder: (context, index) {
            final dayInfo = listAvailableTime[index];

            List times = dayInfo['times'] as List;

            if (times.isEmpty) {
              return Container();
            }
            if (dayInfo['isAvailable'] && dayInfo['dayTime'] == dayTime) {
              return Row(
                children: dayInfo['times'].map<Widget>((time) {
                  return buildTimeChip(time['time']);
                }).toList(),
              );
            }
            return Container();
          },
        ),
      );
  Widget buildTimeChip(String title) => Padding(
        padding: const EdgeInsets.only(left: SizeConstant.md),
        child: SelectChip(
          title: title,
          isSelected: true,
          onTap: () {},
        ),
      );
}
