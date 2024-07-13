import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/constant/size-constant.dart';
import '../../../../../shared/style/mytext-style.dart';
import '../../../../../shared/utils/mysizebox.dart';

class UserRatingCard extends StatelessWidget {
  const UserRatingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return buildUserRatingCard(context);
  }

  Widget buildUserRatingCard(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '5.0',
            style: MyTextStyle.getSubTitleStyle(
                context, SizeConstant.fontSizeSm, context.onBackgroundColor),
          ),
          MySizebox.getHorizontalSizedBox(SizeConstant.spaceSm),
          Icon(
            Icons.star,
            color: context.primaryColor,
            size: SizeConstant.iconSm,
          ),
          MySizebox.getHorizontalSizedBox(SizeConstant.spaceSm),
          Text(
            '107 Reviews',
            style: MyTextStyle.getSubTitleStyle(
                context, SizeConstant.fontSizeSm, context.onBackgroundColor),
          ),
        ],
      );
}
