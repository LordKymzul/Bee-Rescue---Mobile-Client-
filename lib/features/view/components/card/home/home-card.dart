import 'package:beerescue_mobile/features/view/components/card/util/default-card.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/constant/size-constant.dart';
import '../../../../../shared/style/mytext-style.dart';
import '../../../../../shared/utils/mysizebox.dart';

class HomeCard extends StatelessWidget {
  final String title;
  final IconData iconData;
  final VoidCallback onTap;
  const HomeCard(
      {super.key,
      required this.title,
      required this.iconData,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return buildHomeCard(context);
  }

  Widget buildHomeCard(BuildContext context) => InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(SizeConstant.md),
        child: DefaultCard(
            content: Padding(
          padding: const EdgeInsets.all(SizeConstant.md),
          child: Column(
            children: [
              Icon(
                iconData,
                size: SizeConstant.iconLg,
                color: context.primaryColor,
              ),
              MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
              Text(
                title,
                style: MyTextStyle.getSubTitleStyle(context,
                    SizeConstant.fontSizeMd, context.onBackgroundColor),
              )
            ],
          ),
        )),
      );
}
