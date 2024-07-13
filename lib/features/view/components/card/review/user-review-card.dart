import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/constant/assets-constant.dart';
import '../../../../../shared/constant/size-constant.dart';
import '../../../../../shared/constant/words-constant.dart';
import '../../../../../shared/style/mytext-style.dart';
import '../../../../../shared/utils/mysizebox.dart';
import '../../util/rating-bar.dart';
import '../util/entity-card.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return buildUserReviewCard(context);
  }

  Widget buildUserReviewCard(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EntityCard(
              title: 'John Cena',
              desc: '20 Nov 2020',
              imagePath: AssetsConstant.avatarDummy),
          RatingBar(
              rating: 5.0,
              iconSize: SizeConstant.iconXs,
              space: SizeConstant.xs),
          MySizebox.getVerticalSizedBox(SizeConstant.spaceSm),
          Text(
            WordsConstant.loremExample,
            style: MyTextStyle.getSubTitleStyle(
                context, SizeConstant.fontSizeSm, context.onBackgroundColor),
          )
        ],
      );
}
