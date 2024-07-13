import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:flutter/material.dart';

import '../../../../shared/constant/size-constant.dart';
import '../../../../shared/style/mytext-style.dart';

class StatusChip extends StatelessWidget {
  final String status;
  const StatusChip({super.key, required this.status});

  Color buildColor(BuildContext context) {
    if (status == 'Active') {
      return context.blueColor;
    }
    if (status == 'Success' || status == 'Hive') {
      return context.greenColor;
    }
    if (status == 'Pending') {
      return context.orangeColor;
    }

    if (status == 'Unhive') {
      return context.maroonColor;
    }

    if (status == 'Cancelled') {
      return context.redColor;
    }
    return context.primaryColor;
  }

  @override
  Widget build(BuildContext context) {
    return buildStatusChip(context);
  }

  Widget buildStatusChip(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(
            horizontal: SizeConstant.lg, vertical: SizeConstant.sm),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConstant.xl),
            color: buildColor(context).withOpacity(0.3)),
        child: Text(
          status,
          style: MyTextStyle.getTitleStyle(
              context, SizeConstant.fontSizeSm, buildColor(context)),
        ),
      );
}
