import 'package:accordion/accordion.dart';
import 'package:beerescue_mobile/features/view/components/button/default-button.dart';
import 'package:beerescue_mobile/features/view/components/input/invisible-input.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:flutter/material.dart';

import '../../../../shared/constant/size-constant.dart';
import '../../../../shared/style/myappbar-style.dart';
import '../../../../shared/style/mytext-style.dart';
import '../../../../shared/utils/mysizebox.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  List<Map<String, dynamic>> listAvailableTime = [
    {
      "day": "Monday",
      "times": [
        {
          "time": {"start": "9:00", "end": "12:00"}
        },
        {
          "time": {"start": "13:00", "end": "15:00"}
        },
        {
          "time": {"start": "17:00", "end": "21:00"}
        }
      ],
      "isExpanded": false,
      "isAvailable": true
    },
    {
      "day": "Tuesday",
      "times": [
        {
          "time": {"start": "08:00", "end": "11:00"}
        },
        {
          "time": {"start": "12:00", "end": "15:00"}
        },
        {
          "time": {"start": "16:00", "end": "19:00"}
        }
      ],
      "isExpanded": false,
      "isAvailable": true
    },
    {
      "day": "Wednesday",
      "times": [
        {
          "time": {"start": "10:00", "end": "13:00"}
        },
        {
          "time": {"start": "14:00", "end": "17:00"}
        },
        {
          "time": {"start": "18:00", "end": "21:00"}
        }
      ],
      "isExpanded": false,
      "isAvailable": true
    },
    {
      "day": "Thursday",
      "times": [
        {
          "time": {"start": "09:00", "end": "12:00"}
        },
        {
          "time": {"start": "13:00", "end": "17:00"}
        },
        {
          "time": {"start": "18:00", "end": "21:00"}
        }
      ],
      "isExpanded": false,
      "isAvailable": true
    },
    {
      "day": "Friday",
      "times": [
        {
          "time": {"start": "08:00", "end": "11:00"}
        },
        {
          "time": {"start": "12:00", "end": "15:00"}
        },
        {
          "time": {"start": "16:00", "end": "19:00"}
        }
      ],
      "isExpanded": false,
      "isAvailable": true
    },
    {
      "day": "Saturday",
      "times": [
        {
          "time": {"start": "10:00", "end": "13:00"}
        },
        {
          "time": {"start": "14:00", "end": "17:00"}
        },
        {
          "time": {"start": "18:00", "end": "21:00"}
        }
      ],
      "isExpanded": false,
      "isAvailable": false
    },
    {
      "day": "Sunday",
      "times": [
        {
          "time": {"start": "09:00", "end": "12:00"}
        },
        {
          "time": {"start": "13:00", "end": "17:00"}
        },
        {
          "time": {"start": "18:00", "end": "21:00"}
        }
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

  void handleSwitchOnChanged(Map<String, dynamic> availableTime, bool value) {
    setState(() {
      if (!availableTime['isAvailable']) {
        availableTime['isExpanded'] = true;
      } else {
        availableTime['isExpanded'] = false;
      }
      availableTime['isAvailable'] = value;
    });
  }

  void handleSelectTime(Map<String, dynamic> eachAvailableTime, int timeIndex,
      bool isStart) async {
    final TimeOfDay? timeOfDay =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (timeOfDay != null) {
      setState(() {
        final formattedTime = MaterialLocalizations.of(context)
            .formatTimeOfDay(timeOfDay, alwaysUse24HourFormat: true);
        eachAvailableTime['times'][timeIndex]['time']
            [isStart ? 'start' : 'end'] = formattedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildHeader(),
            buildExpansionPanelList(),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) => MyAppBarStyle.defaultAppBar(
      context,
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: context.onBackgroundColor,
              )),
          Text(
            'Schedule',
            style: MyTextStyle.getTitleStyle(
                context, SizeConstant.fontSizeLg, context.onBackgroundColor),
          )
        ],
      ));

  Widget buildHeader() => Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: SizeConstant.md, vertical: SizeConstant.md),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hive Time Schedule',
                    style: MyTextStyle.getTitleStyle(context,
                        SizeConstant.fontSizeLg, context.onBackgroundColor),
                  ),
                  MySizebox.getVerticalSizedBox(SizeConstant.spaceSm),
                  Text(
                    'Dont forget to click the save button.',
                    style: MyTextStyle.getSubTitleStyle(context,
                        SizeConstant.fontSizeMd, context.onBackgroundColor),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: DefaultButton(
                  buttonTitle: 'Save', buttonOnPressed: () {}, isPrimary: true),
            )
          ],
        ),
      );

  Widget buildExpansionPanelList() => ExpansionPanelList(
        elevation: 0,
        dividerColor: Colors.transparent,
        expandedHeaderPadding: EdgeInsets.zero,
        expansionCallback: (panelIndex, isExpanded) {
          setIsExpanded(panelIndex, isExpanded);
        },
        children: listAvailableTime
            .asMap()
            .entries
            .map((entry) => buildExpansionPanel(entry.value, entry.key))
            .toList(),
      );

  ExpansionPanel buildExpansionPanel(
          Map<String, dynamic> availableTime, int index) =>
      ExpansionPanel(
          backgroundColor: context.backgroundColor,
          headerBuilder: (context, isExpanded) {
            return buildHeaderAccordian(availableTime);
          },
          body: buildContentAccordian(availableTime),
          isExpanded: availableTime['isExpanded']);

  Widget buildHeaderAccordian(Map<String, dynamic> availableTime) => Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Switch(
                activeColor: context.primaryColor,
                activeTrackColor: context.primaryColor.withOpacity(0.2),
                value: availableTime['isAvailable'],
                onChanged: (value) {
                  handleSwitchOnChanged(availableTime, value);
                },
              ),
              MySizebox.getHorizontalSizedBox(SizeConstant.spaceSm),
              Text(
                availableTime['day'],
                style: MyTextStyle.getSubTitleStyle(context,
                    SizeConstant.fontSizeMd, context.onBackgroundColor),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: availableTime['times'].map<Widget>((eachTime) {
              String timeRange =
                  eachTime['time']['start'] + " - " + eachTime['time']['end'];
              return buildTime(context, timeRange);
            }).toList(),
          ),
        ],
      );

  Widget buildContentAccordian(Map<String, dynamic> availableTime) => Padding(
        padding: const EdgeInsets.symmetric(vertical: SizeConstant.md),
        child: Column(
          children: availableTime['times'].asMap().entries.map<Widget>((entry) {
            int timeIndex = entry.key;
            Map<String, dynamic> time = entry.value;
            String timeRange =
                time['time']['start'] + " - " + time['time']['end'];
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: SizeConstant.spaceMd,
                vertical: SizeConstant.spaceSm,
              ),
              child: buildSelectedTimeContainer(availableTime, timeIndex),
            );
          }).toList(),
        ),
      );

  Widget buildSelectedTimeContainer(
          Map<String, dynamic> eachAvailableTime, int timeIndex) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: DefaultButton(
                buttonTitle: eachAvailableTime['times'][timeIndex]['time']
                    ['start'],
                buttonOnPressed: () {
                  handleSelectTime(eachAvailableTime, timeIndex, true);
                },
                isPrimary: false),
          ),
          MySizebox.getHorizontalSizedBox(SizeConstant.spaceMd),
          Text(
            'To',
            style: MyTextStyle.getTitleStyle(
                context, SizeConstant.fontSizeMd, context.onBackgroundColor),
          ),
          MySizebox.getHorizontalSizedBox(SizeConstant.spaceMd),
          Expanded(
            child: DefaultButton(
                buttonTitle: eachAvailableTime['times'][timeIndex]['time']
                    ['end'],
                buttonOnPressed: () {
                  handleSelectTime(eachAvailableTime, timeIndex, false);
                },
                isPrimary: false),
          ),
        ],
      );

  Widget buildTime(BuildContext context, String time) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizeConstant.sm),
        child: Text(
          time,
          style: MyTextStyle.getSubTitleStyle(
              context, SizeConstant.fontSizeMd, context.onBackgroundColor),
        ),
      );
}
