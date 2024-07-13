import 'package:beerescue_mobile/features/view/components/card/util/entity-card.dart';
import 'package:beerescue_mobile/features/view/components/card/review/user-review-card.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/constant/assets-constant.dart';
import 'package:beerescue_mobile/shared/constant/words-constant.dart';
import 'package:beerescue_mobile/shared/utils/mysizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';

import '../../../../shared/constant/size-constant.dart';
import '../../../../shared/style/myappbar-style.dart';
import '../../../../shared/style/mytext-style.dart';
import '../../components/util/rating-bar.dart';

class ListReviewScreen extends StatelessWidget {
  const ListReviewScreen({super.key});

  final double rating = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      appBar: buildAppBar(context),
      body: Column(
        children: [
          buildHeader(context),
          Expanded(
              child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return buildUserReviewCard();
            },
          ))
        ],
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
            'Reviews',
            style: MyTextStyle.getTitleStyle(
                context, SizeConstant.fontSizeLg, context.onBackgroundColor),
          )
        ],
      ));

  Widget buildHeader(BuildContext context) => Center(
        child: Column(
          children: [
            Text(
              '5.0',
              style: MyTextStyle.getTitleStyle(
                  context, SizeConstant.fontSizeXlg, context.onBackgroundColor),
            ),
            MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
            RatingBar(
                rating: rating,
                iconSize: SizeConstant.iconMd,
                space: SizeConstant.xs),
            MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
            Text(
              '10 Reviews',
              style: MyTextStyle.getSubTitleStyle(
                  context, SizeConstant.fontSizeMd, context.onBackgroundColor),
            )
          ],
        ),
      );

  Widget buildUserReviewCard() => const Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConstant.md, vertical: SizeConstant.sm),
        child: UserReviewCard(),
      );
}
