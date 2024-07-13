import 'package:beerescue_mobile/features/view/components/card/review/user-rating-card.dart';
import 'package:beerescue_mobile/features/view/components/card/util/default-card.dart';
import 'package:beerescue_mobile/features/view/components/card/util/entity-card.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/constant/assets-constant.dart';
import 'package:beerescue_mobile/shared/utils/mysizebox.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/constant/size-constant.dart';
import '../../../../../shared/style/myappbar-style.dart';
import '../../../../../shared/style/mytext-style.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  final List<GlobalKey> keys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  late ScrollController scrollController;
  late ScrollController screenController;
  BuildContext? tabContext;

  @override
  void initState() {
    scrollController = ScrollController();
    screenController = ScrollController();
    scrollController.addListener(animateToTab);

    super.initState();
  }

  void animateToTab() {
    late RenderBox renderBox;

    for (var i = 0; i < keys.length; i++) {
      renderBox = keys[i].currentContext!.findRenderObject() as RenderBox;
      Offset position = renderBox.localToGlobal(Offset.zero);
      if (scrollController.offset >= position.dy) {
        print('Scroll');
        DefaultTabController.of(tabContext!)
            .animateTo(i, duration: const Duration(milliseconds: 100));
      }
    }
  }

  void scrollToIndex(int index) async {
    scrollController.removeListener(animateToTab);
    final categories = keys[index].currentContext!;
    await Scrollable.ensureVisible(categories,
        duration: const Duration(milliseconds: 500));
    scrollController.addListener(animateToTab);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      appBar: buildAppBar(context),
      body: DefaultTabController(
        length: 3,
        child: Builder(
          builder: (context) {
            tabContext = context;
            return NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [buildSilverAppBar(context)];
                },
                body: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      buildCategoryTile('All Time', 0),
                      buildAllTimeListLeaderboardCard(),
                      buildCategoryTile('Last 7 Days', 1),
                      build7DaysListLeaderboardCard(),
                      buildCategoryTile('Last 30 Days', 2),
                      build30DaysListLeaderboardCard(),
                    ],
                  ),
                ));
          },
        ),
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
            'Leaderboard',
            style: MyTextStyle.getTitleStyle(
                context, SizeConstant.fontSizeLg, context.onBackgroundColor),
          )
        ],
      ));

  Widget buildSilverAppBar(BuildContext context) {
    return MyAppBarStyle.buildCustomSilverAppBar(
      context,
      [
        Tab(
          child: Text('All Time',
              style: MyTextStyle.getTitleStyle(
                  context, 14, context.onBackgroundColor)),
        ),
        Tab(
          child: Text('Last 7 Days',
              style: MyTextStyle.getTitleStyle(
                  context, 14, context.onBackgroundColor)),
        ),
        Tab(
          child: Text('Last 30 Days',
              style: MyTextStyle.getTitleStyle(
                  context, 14, context.onBackgroundColor)),
        ),
      ],
      (p0) {
        scrollToIndex(p0);
      },
    );
  }

  Widget buildCategoryTile(String title, int index) => Padding(
        key: keys[index],
        padding: const EdgeInsets.symmetric(horizontal: SizeConstant.md),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: MyTextStyle.getTitleStyle(context,
                      SizeConstant.fontSizeLg, context.onBackgroundColor),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See all',
                    style: MyTextStyle.getTitleStyle(
                        context, SizeConstant.fontSizeSm, context.primaryColor),
                  ),
                )
              ],
            ),
            Divider(
              thickness: 1,
              color: context.greyColor,
            )
          ],
        ),
      );

  Widget buildAllTimeListLeaderboardCard() => Column(
        children: [
          buildLeaderboardCard(),
          buildLeaderboardCard(),
          buildLeaderboardCard()
        ],
      );

  Widget build7DaysListLeaderboardCard() => Column(
        children: [
          buildLeaderboardCard(),
          buildLeaderboardCard(),
          buildLeaderboardCard()
        ],
      );

  Widget build30DaysListLeaderboardCard() => Column(
        children: [
          buildLeaderboardCard(),
          buildLeaderboardCard(),
          buildLeaderboardCard(),
          buildLeaderboardCard(),
          buildLeaderboardCard()
        ],
      );

  Widget buildLeaderboardCard() => Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: SizeConstant.md, vertical: SizeConstant.sm),
        child: DefaultCard(
          content:
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text(
              '1',
              style: MyTextStyle.getTitleStyle(
                  context, SizeConstant.fontSizeLg, context.onBackgroundColor),
            ),
            MySizebox.getHorizontalSizedBox(SizeConstant.spaceMd),
            Expanded(
              child: EntityCard(
                  title: 'Irfan Ghaphar',
                  desc: '40 Cases',
                  imagePath: AssetsConstant.dpIrfan),
            ),
            UserRatingCard()
          ]),
        ),
      );
}
