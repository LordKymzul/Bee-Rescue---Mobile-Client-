import 'package:beerescue_mobile/features/view/components/button/default-button.dart';
import 'package:beerescue_mobile/features/view/components/card/case/case-card.dart';
import 'package:beerescue_mobile/features/view/components/card/review/user-rating-card.dart';
import 'package:beerescue_mobile/features/view/components/card/review/user-review-card.dart';
import 'package:beerescue_mobile/features/view/components/card/util/avatar-card.dart';
import 'package:beerescue_mobile/features/view/screen/explore/book/book-appoinment-screen.dart';
import 'package:beerescue_mobile/features/view/screen/profile/user-detail/user-detail-about-screen.dart';
import 'package:beerescue_mobile/features/view/screen/profile/user-detail/user-detail-cases-screen.dart';
import 'package:beerescue_mobile/features/view/screen/profile/user-detail/user-detail-reviews-screen.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/constant/assets-constant.dart';
import 'package:beerescue_mobile/shared/utils/mysizebox.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../shared/constant/size-constant.dart';
import '../../../../../shared/style/myappbar-style.dart';
import '../../../../../shared/style/mytext-style.dart';

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({super.key});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.backgroundColor,
        appBar: buildAppBar(context),
        body: Column(
          children: [
            Expanded(
              child: DefaultTabController(
                  length: 3,
                  child: NestedScrollView(
                      headerSliverBuilder: (context, innerBoxIsScrolled) {
                        return [
                          SliverToBoxAdapter(child: buildHeader()),
                          buildSilverAppBar(context)
                        ];
                      },
                      body: TabBarView(
                        children: [
                          UserDetailAboutScreen(),
                          UserDetailCasesScreen(),
                          UserDetailReviewsScreen(),
                        ],
                      ))),
            ),
            buildAppoinmentButton()
          ],
        ));
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
            'Hiver Profile',
            style: MyTextStyle.getTitleStyle(
                context, SizeConstant.fontSizeLg, context.onBackgroundColor),
          )
        ],
      ));

  Widget buildSilverAppBar(BuildContext context) {
    return MyAppBarStyle.buildSilverAppBar(context, [
      Tab(
        child: Text('About',
            style: MyTextStyle.getTitleStyle(
                context, 14, context.onBackgroundColor)),
      ),
      Tab(
        child: Text('Cases',
            style: MyTextStyle.getTitleStyle(
                context, 14, context.onBackgroundColor)),
      ),
      Tab(
        child: Text('Reviews',
            style: MyTextStyle.getTitleStyle(
                context, 14, context.onBackgroundColor)),
      ),
    ]);
  }

  Widget buildHeader() => Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: SizeConstant.md, vertical: SizeConstant.md),
        child: Column(
          children: [
            buildUserInfoHeader(),
            MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildUserInfoCard(41.toString(), 'Clients', Iconsax.people),
                buildUserInfoCard(10.toString(), 'Reviews', Icons.reviews),
                buildUserInfoCard(5.0.toString(), 'Ratings', Iconsax.star),
                buildUserInfoCard(21.toString(), 'Age', Iconsax.user),
              ],
            )
          ],
        ),
      );

  Widget buildUserInfoHeader() => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AvatarCard(imagePath: AssetsConstant.dpIrfan, radius: 40),
          MySizebox.getHorizontalSizedBox(SizeConstant.spaceLg),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Irfan Ghaphar',
                style: MyTextStyle.getTitleStyle(context,
                    SizeConstant.fontSizeLg, context.onBackgroundColor),
              ),
              MySizebox.getVerticalSizedBox(SizeConstant.spaceSm),
              UserRatingCard(),
              MySizebox.getVerticalSizedBox(SizeConstant.spaceSm),
            ],
          )
        ],
      );

  Widget buildUserInfoCard(String value, String desc, IconData iconData) =>
      Column(
        children: [
          Container(
            padding: const EdgeInsets.all(SizeConstant.md),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.primaryColor.withOpacity(0.3)),
            child: Icon(
              iconData,
              color: context.primaryColor,
            ),
          ),
          MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
          Text(
            value,
            style: MyTextStyle.getTitleStyle(
                context, SizeConstant.fontSizeLg, context.primaryColor),
          ),
          MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
          Text(
            desc,
            style: MyTextStyle.getSubTitleStyle(
                context, SizeConstant.fontSizeSm, context.onBackgroundColor),
          ),
        ],
      );

  Widget buildAppoinmentButton() => Padding(
        padding: const EdgeInsets.only(
            left: SizeConstant.md,
            right: SizeConstant.md,
            bottom: SizeConstant.sm),
        child: DefaultButton(
            buttonTitle: 'Make appoinment',
            buttonOnPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BookAppoinmentScreen(),
              ));
            },
            isPrimary: true),
      );
}
