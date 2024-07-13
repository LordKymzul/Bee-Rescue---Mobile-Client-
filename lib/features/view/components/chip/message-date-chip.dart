import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../shared/constant/size-constant.dart';
import '../../../../shared/style/mytext-style.dart';

class MessageDateChip extends StatelessWidget {
  DateTime dateTime;
  MessageDateChip({super.key, required this.dateTime});

  String handleDate(DateTime dateTime) {
    DateTime now = DateTime.now();
    DateTime yesterday = DateTime(now.year, now.month, now.day - 1);

    if (dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day) {
      return 'Today';
    }
    if (dateTime.year == yesterday.year &&
        dateTime.month == yesterday.month &&
        dateTime.day == yesterday.day) {
      return 'Yesterday';
    }

    String formattedDate = DateFormat('dd MMM yyyy').format(dateTime);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(SizeConstant.sm),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConstant.sm),
            color: context.primaryColor),
        child: Text(
          handleDate(dateTime),
          style: MyTextStyle.getTitleStyle(
              context, SizeConstant.fontSizeMd, context.onPrimaryColor),
        ));
  }
}
