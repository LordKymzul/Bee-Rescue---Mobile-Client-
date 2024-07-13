import 'package:beerescue_mobile/features/view/components/button/default-button.dart';
import 'package:beerescue_mobile/features/view/components/card/review/user-rating-card.dart';
import 'package:beerescue_mobile/features/view/components/card/util/avatar-card.dart';
import 'package:beerescue_mobile/features/view/components/chip/role-chip.dart';
import 'package:beerescue_mobile/features/view/screen/home/case/case-detail/case-detail-desc-screen.dart';
import 'package:beerescue_mobile/features/view/screen/home/case/case-detail/case-detail-status-screen.dart';
import 'package:beerescue_mobile/features/view/screen/home/case/review/write-review-screen.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/constant/assets-constant.dart';
import 'package:beerescue_mobile/shared/constant/words-constant.dart';
import 'package:beerescue_mobile/shared/utils/mysizebox.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../../shared/constant/size-constant.dart';
import '../../../../../../shared/style/myappbar-style.dart';
import '../../../../../../shared/style/mytext-style.dart';

class CaseDetailScreen extends StatefulWidget {
  const CaseDetailScreen({super.key});

  @override
  State<CaseDetailScreen> createState() => _CaseDetailScreenState();
}

class _CaseDetailScreenState extends State<CaseDetailScreen> {
  final double coverHeight = 160;
  final double profileHeight = 80;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.backgroundColor,
        appBar: buildAppBar(),
        body: Column(
          children: [
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: NestedScrollView(
                    headerSliverBuilder: (context, innerBoxIsScrolled) {
                      return [
                        SliverToBoxAdapter(child: buildHeader()),
                        buildSilverAppBar(context)
                      ];
                    },
                    body: TabBarView(children: [
                      CaseDetailStatusScreen(),
                      CaseDetailDescScreen()
                    ])),
              ),
            ),
            buildFooter()
          ],
        ));
  }

  AppBar buildAppBar() => MyAppBarStyle.defaultAppBar(
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
            'Track',
            style: MyTextStyle.getTitleStyle(
                context, SizeConstant.fontSizeLg, context.onBackgroundColor),
          )
        ],
      ));

  Widget buildSilverAppBar(BuildContext context) {
    return MyAppBarStyle.buildSilverAppBar(context, [
      Tab(
        child: Text('Status',
            style: MyTextStyle.getTitleStyle(
                context, 14, context.onBackgroundColor)),
      ),
      Tab(
        child: Text('Detail',
            style: MyTextStyle.getTitleStyle(
                context, 14, context.onBackgroundColor)),
      ),
    ]);
  }

  Widget buildHeader() => Column(
        children: [
          buildTop(),
          MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
          buildContent()
        ],
      );

  Widget buildTop() {
    final top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.centerLeft,
      children: [
        Container(
            margin: EdgeInsets.only(bottom: bottom), child: buildCoverImage()),
        Positioned(top: top, child: buildProfileImage())
      ],
    );
  }

  Widget buildCoverImage() => Image.asset(
        AssetsConstant.banner,
        width: double.infinity,
        height: coverHeight,
        fit: BoxFit.cover,
      );

  Widget buildProfileImage() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizeConstant.md),
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: context.backgroundColor, width: 4)),
          child: AvatarCard(
              imagePath: AssetsConstant.dpIrfan, radius: profileHeight / 2),
        ),
      );

  Widget buildContent() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizeConstant.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Irfan Ghaphar',
                  style: MyTextStyle.getTitleStyle(context,
                      SizeConstant.fontSizeMd, context.onBackgroundColor),
                ),
                const RoleChip(role: 'Hiver')
              ],
            ),
            MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
            Text(
              WordsConstant.loremExample,
              style: MyTextStyle.getSubTitleStyle(
                  context, SizeConstant.fontSizeSm, context.onBackgroundColor),
            ),
            MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
            Row(
              children: [
                Expanded(
                    child: DefaultButton(
                        buttonTitle: 'Open in Maps',
                        buttonOnPressed: () {},
                        isPrimary: false)),
                MySizebox.getHorizontalSizedBox(SizeConstant.spaceMd),
                Expanded(
                    child: DefaultButton(
                        buttonTitle: 'Chat',
                        buttonOnPressed: () {},
                        isPrimary: true))
              ],
            )
          ],
        ),
      );

  Widget buildFooter() => Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: SizeConstant.md, vertical: SizeConstant.sm),
        child: DefaultButton(
            buttonTitle: 'Review',
            buttonOnPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => WriteReviewScreen(),
              ));
            },
            isPrimary: true),
      );
}
