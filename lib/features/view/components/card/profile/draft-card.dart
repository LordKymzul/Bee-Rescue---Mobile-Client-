import 'package:beerescue_mobile/features/view/components/button/default-button.dart';
import 'package:beerescue_mobile/features/view/components/card/util/default-card.dart';
import 'package:beerescue_mobile/features/view/components/card/util/entity-card.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/constant/assets-constant.dart';
import '../../../../../shared/constant/size-constant.dart';
import '../../../../../shared/style/mytext-style.dart';
import '../../../../../shared/utils/mysizebox.dart';

class DraftCard extends StatelessWidget {
  const DraftCard({super.key});

  @override
  Widget build(BuildContext context) {
    return buildDraftCard(context);
  }

  Widget buildDraftCard(BuildContext context) => DefaultCard(
          content: Column(
        children: [
          const EntityCard(
              title: 'Irfan Ghaphar',
              desc: 'Hiver',
              imagePath: AssetsConstant.dpIrfan),
          MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
          buildMiddle(context),
          MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
          buildBottom()
        ],
      ));

  Widget buildMiddle(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildMiddleCard(context, 'Client', 'Muhammad Hakim'),
          buildMiddleCard(context, 'Draft Date', '8 April 2024 18:00')
        ],
      );

  Widget buildMiddleCard(
          BuildContext context, final String title, final String desc) =>
      Column(
        crossAxisAlignment: title == 'Draft Date'
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: MyTextStyle.getTitleStyle(
                context, SizeConstant.fontSizeMd, context.onBackgroundColor),
          ),
          MySizebox.getVerticalSizedBox(SizeConstant.spaceSm),
          Text(
            desc,
            style: MyTextStyle.getSubTitleStyle(
                context, SizeConstant.fontSizeSm, context.onBackgroundColor),
          )
        ],
      );

  Widget buildBottom() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: DefaultButton(
                buttonTitle: 'Delete',
                buttonOnPressed: () {},
                isPrimary: false),
          ),
          MySizebox.getHorizontalSizedBox(SizeConstant.spaceMd),
          Expanded(
            child: DefaultButton(
                buttonTitle: 'Continue',
                buttonOnPressed: () {},
                isPrimary: true),
          )
        ],
      );
}
