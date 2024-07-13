import 'package:beerescue_mobile/features/view/screen/explore/book/book-appoinment-screen.dart';
import 'package:beerescue_mobile/features/view/screen/profile/user-detail/user-detail-screen.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/utils/url-services.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/constant/assets-constant.dart';
import '../../../../../shared/constant/size-constant.dart';
import '../../../../../shared/constant/words-constant.dart';
import '../../../../../shared/style/mytext-style.dart';
import '../../../../../shared/utils/mysizebox.dart';
import '../../button/default-button.dart';
import '../review/user-rating-card.dart';
import '../util/avatar-card.dart';
import '../util/default-card.dart';

class HiverCard extends StatelessWidget {
  const HiverCard({super.key});

  @override
  Widget build(BuildContext context) {
    return buildHiverCard(context);
  }

  Widget buildHiverCard(BuildContext context) => DefaultCard(
          content: Column(
        children: [
          buildHeader(context),
          MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
          Text(
            WordsConstant.loremExample,
            style: MyTextStyle.getSubTitleStyle(
                context, SizeConstant.fontSizeMd, context.onBackgroundColor),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
          buildButtons(context)
        ],
      ));

  Widget buildHeader(BuildContext context) => ListTile(
        contentPadding: EdgeInsets.zero,
        leading: AvatarCard(imagePath: AssetsConstant.avatarDummy, radius: 25),
        title: Text(
          'Muhammad Hakim',
          style: MyTextStyle.getTitleStyle(
              context, SizeConstant.fontSizeMd, context.onBackgroundColor),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            UserRatingCard(),
          ],
        ),
        trailing: Text(
          '20.96 km Nearby',
          style: MyTextStyle.getSubTitleStyle(
              context, SizeConstant.fontSizeMd, context.onBackgroundColor),
        ),
      );

  Widget buildButtons(BuildContext context) => Row(
        children: [
          Expanded(
              child: DefaultButton(
                  buttonTitle: 'Open in Maps',
                  buttonOnPressed: () {
                    URLServices.goToMap(
                        context: context, lat: 3.221805, lng: 101.7256583);
                  },
                  isPrimary: false)),
          MySizebox.getHorizontalSizedBox(SizeConstant.spaceMd),
          Expanded(
              child: DefaultButton(
                  buttonTitle: 'View Profile',
                  buttonOnPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UserDetailScreen(),
                    ));
                  },
                  isPrimary: true))
        ],
      );
}
