import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/constant/size-constant.dart';
import 'package:beerescue_mobile/shared/style/mytext-style.dart';
import 'package:beerescue_mobile/shared/utils/mysizebox.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:timeline_tile/timeline_tile.dart';

class StatusTimeline extends StatelessWidget {
  final bool isFirst, isLast, isPast;
  final Map<String, dynamic> caseStatusTimeline;

  const StatusTimeline(
      {super.key,
      required this.isFirst,
      required this.isLast,
      required this.isPast,
      required this.caseStatusTimeline});

  @override
  Widget build(BuildContext context) {
    return buildTimeLineTuto(context);
  }

  Widget buildTimeLineTuto(BuildContext context) => SizedBox(
      height: 100,
      child: TimelineTile(
          isFirst: isFirst,
          isLast: isLast,
          beforeLineStyle: LineStyle(
              color: isPast ? context.primaryColor : context.greyColor),
          indicatorStyle: IndicatorStyle(
              width: 40,
              color: isPast ? context.primaryColor : context.greyColor,
              iconStyle: IconStyle(
                  fontSize: SizeConstant.iconMd,
                  iconData: Icons.done_outline,
                  color: context.onPrimaryColor)),
          endChild: EventCard(
            caseStatusTimeline: caseStatusTimeline,
            isPast: isPast,
          )));
}

class EventCard extends StatelessWidget {
  final Map<String, dynamic> caseStatusTimeline;
  final bool isPast;
  const EventCard(
      {super.key, required this.caseStatusTimeline, required this.isPast});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        caseStatusTimeline['statusTitle'],
        style: MyTextStyle.getTitleStyle(
            context, SizeConstant.fontSizeMd, context.onBackgroundColor),
      ),
      subtitle: Text(
        caseStatusTimeline['statusDesc'],
        style: MyTextStyle.getSubTitleStyle(
            context, SizeConstant.fontSizeSm, context.onBackgroundColor),
      ),
      trailing: Icon(
        caseStatusTimeline['statusIcon'],
        color: isPast ? context.primaryColor : context.greyColor,
      ),
    );
  }
}
