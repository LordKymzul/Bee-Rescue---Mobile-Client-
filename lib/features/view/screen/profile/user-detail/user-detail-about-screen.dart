import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/constant/size-constant.dart';
import 'package:beerescue_mobile/shared/constant/words-constant.dart';
import 'package:beerescue_mobile/shared/style/mytext-style.dart';
import 'package:beerescue_mobile/shared/utils/mysizebox.dart';
import 'package:flutter/material.dart';

class UserDetailAboutScreen extends StatefulWidget {
  const UserDetailAboutScreen({super.key});

  @override
  State<UserDetailAboutScreen> createState() => _UserDetailAboutScreenState();
}

class _UserDetailAboutScreenState extends State<UserDetailAboutScreen> {
  List<Map<String, dynamic>> listAvailableTime = [
    {
      "day": "Monday",
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
      "times": [
        {"time": "10:00 - 13:00"},
        {"time": "14:00 - 17:00"},
        {"time": "18:00 - 21:00"}
      ],
      "isExpanded": false,
      "isAvailable": false
    },
    {
      "day": "Sunday",
      "times": [
        {"time": "9:00 - 12:00"},
        {"time": "13:00 - 17:00"},
        {"time": "18:00 - 21:00"}
      ],
      "isExpanded": false,
      "isAvailable": false
    },
  ];

  void setIsExpanded(int index, bool isExpanded) {
    setState(() {
      listAvailableTime[index]['isExpanded'] = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
            buildAbout(),
            MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
            buildContainerAvailableTime()
          ],
        ),
      ),
    );
  }

  Widget buildAbout() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizeConstant.md),
        child: Text(
          "${WordsConstant.loremExample}\n\n${WordsConstant.loremExample}",
          style: MyTextStyle.getSubTitleStyle(
              context, SizeConstant.fontSizeSm, context.onBackgroundColor),
        ),
      );

  Widget buildContainerAvailableTime() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizeConstant.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Available Time',
              style: MyTextStyle.getTitleStyle(
                  context, SizeConstant.fontSizeMd, context.onBackgroundColor),
            ),
            MySizebox.getVerticalSizedBox(SizeConstant.spaceSm),
            ExpansionPanelList(
              elevation: 0,
              expandedHeaderPadding: EdgeInsets.zero,
              expansionCallback: (panelIndex, isExpanded) {
                setIsExpanded(panelIndex, isExpanded);
              },
              children: listAvailableTime
                  .map((eachAvailableTime) =>
                      buildExpansionPanel(eachAvailableTime))
                  .toList(),
            )
          ],
        ),
      );

  ExpansionPanel buildExpansionPanel(Map<String, dynamic> availableTime) =>
      ExpansionPanel(
          backgroundColor: context.backgroundColor,
          headerBuilder: (context, isExpanded) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.circle,
                  color: availableTime['isAvailable']
                      ? context.primaryColor
                      : context.greyColor,
                ),
                MySizebox.getHorizontalSizedBox(SizeConstant.spaceSm),
                Text(
                  availableTime['day'],
                  style: MyTextStyle.getSubTitleStyle(context,
                      SizeConstant.fontSizeMd, context.onBackgroundColor),
                ),
              ],
            );
          },
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: availableTime['times'].map<Widget>((time) {
              return buildTime(context, time['time']);
            }).toList(),
          ),
          isExpanded: availableTime['isExpanded']);

  Widget buildTime(BuildContext context, String time) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizeConstant.sm),
        child: Text(
          time,
          style: MyTextStyle.getSubTitleStyle(
              context, SizeConstant.fontSizeMd, context.onBackgroundColor),
        ),
      );
}
