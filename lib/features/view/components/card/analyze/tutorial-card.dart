import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/constant/assets-constant.dart';
import '../../../../../shared/constant/size-constant.dart';
import '../../../../../shared/style/mytext-style.dart';
import '../../image/default-image.dart';

class TutorialCard extends StatelessWidget {
  const TutorialCard({super.key});

  @override
  Widget build(BuildContext context) {
    return buildTutorialCard(context);
  }

  Widget buildTutorialCard(BuildContext context) => ListTile(
        contentPadding: EdgeInsets.zero,
        leading: const DefaultImage(
          imagePath: AssetsConstant.banner,
          imageHeight: 100,
          imageWidth: 100,
        ),
        title: Text(
          'What is stingless bee?',
          style: MyTextStyle.getTitleStyle(
              context, SizeConstant.fontSizeMd, context.onBackgroundColor),
        ),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Eric Levinson',
              style: MyTextStyle.getSubTitleStyle(
                  context, SizeConstant.fontSizeSm, context.onBackgroundColor),
            ),
            Text(
              '22 May 2020',
              style: MyTextStyle.getSubTitleStyle(
                  context, SizeConstant.fontSizeSm, context.onBackgroundColor),
            ),
          ],
        ),
      );
}
