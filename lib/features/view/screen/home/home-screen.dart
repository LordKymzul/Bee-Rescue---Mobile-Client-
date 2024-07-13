import 'package:beerescue_mobile/features/view/components/card/explore/hiver-card.dart';
import 'package:beerescue_mobile/features/view/components/card/home/booking-card.dart';
import 'package:beerescue_mobile/features/view/components/card/util/avatar-card.dart';
import 'package:beerescue_mobile/features/view/components/card/home/home-card.dart';
import 'package:beerescue_mobile/features/view/screen/home/case/case-screen.dart';
import 'package:beerescue_mobile/features/view/screen/home/leaderboard/leaderboard-screen.dart';
import 'package:beerescue_mobile/features/view/screen/home/hiver/list-hiver-screen.dart';
import 'package:beerescue_mobile/features/view/screen/home/weather/weather-screen.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/constant/assets-constant.dart';
import 'package:beerescue_mobile/shared/constant/size-constant.dart';
import 'package:beerescue_mobile/shared/style/myappbar-style.dart';
import 'package:beerescue_mobile/shared/style/mytext-style.dart';
import 'package:beerescue_mobile/shared/utils/mysizebox.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();
  final SwiperController swiperController = SwiperController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.backgroundColor,
        appBar: buildAppBar(context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
              buildHeader(),
              MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
              buildHeaderContainerBookingCard(),
              MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
              SwiperBuilder(),
              MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
              buildHeaderContainerHomeCard(),
              MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
              buildContainerHomeCard(context),
              MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
              buildHeaderListHiver(),
              MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
              ListHiverTinderCard(),
              MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
            ],
          ),
        ));
  }

  AppBar buildAppBar(BuildContext context) => MyAppBarStyle.defaultAppBar(
      context,
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetsConstant.logo,
            height: 35,
            width: 35,
          ),
          MySizebox.getHorizontalSizedBox(SizeConstant.spaceMd),
          Text(
            'Bee Rescue',
            style: MyTextStyle.getTitleStyle(
                context, SizeConstant.fontSizeLg, context.onBackgroundColor),
          ),
        ],
      ));

  Widget buildHeader() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizeConstant.md),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Back, Hakim',
                    style: MyTextStyle.getTitleStyle(context,
                        SizeConstant.fontSizeLg, context.onBackgroundColor),
                  ),
                  MySizebox.getVerticalSizedBox(SizeConstant.spaceSm),
                  Text(
                    'Here is your overview',
                    style: MyTextStyle.getSubTitleStyle(context,
                        SizeConstant.fontSizeMd, context.onBackgroundColor),
                  )
                ],
              ),
            ),
            AvatarCard(imagePath: AssetsConstant.avatarDummy, radius: 25)
          ],
        ),
      );

  Widget buildHeaderContainerBookingCard() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizeConstant.md),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Appoinments',
              style: MyTextStyle.getTitleStyle(
                  context, SizeConstant.fontSizeMd, context.onBackgroundColor),
            ),
            Text(
              'See all',
              style: MyTextStyle.getTitleStyle(
                  context, SizeConstant.fontSizeMd, context.primaryColor),
            ),
          ],
        ),
      );

  Widget buildBookingCard(BuildContext context) => BookingCard();

  Widget buildHeaderContainerHomeCard() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizeConstant.md),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Features',
              style: MyTextStyle.getTitleStyle(
                  context, SizeConstant.fontSizeMd, context.onBackgroundColor),
            ),
          ],
        ),
      );

  Widget buildContainerHomeCard(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizeConstant.md),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: HomeCard(
              title: 'My Bees',
              iconData: Icons.hive_outlined,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LeaderboardScreen(),
                ));
              },
            )),
            MySizebox.getHorizontalSizedBox(SizeConstant.spaceLg),
            Expanded(
                child: HomeCard(
              title: 'Case',
              iconData: Iconsax.folder_copy,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CaseScreen(),
                ));
              },
            )),
            MySizebox.getHorizontalSizedBox(SizeConstant.spaceLg),
            Expanded(
                child: HomeCard(
              title: 'Weathers',
              iconData: Iconsax.cloud_copy,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => WeatherScreen(),
                ));
              },
            )),
          ],
        ),
      );

  Widget buildHeaderListHiver() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizeConstant.md),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Top Hivers',
              style: MyTextStyle.getTitleStyle(
                  context, SizeConstant.fontSizeMd, context.onBackgroundColor),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ListHiverScreen(),
                ));
              },
              child: Text(
                'See all',
                style: MyTextStyle.getTitleStyle(
                    context, SizeConstant.fontSizeMd, context.primaryColor),
              ),
            ),
          ],
        ),
      );

  Widget buildListHiver() => SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return buildHiverCard();
          },
        ),
      );

  Widget buildHiverCard() => Container(
      width: 400,
      margin: EdgeInsets.symmetric(horizontal: SizeConstant.spaceMd),
      child: HiverCard());

  Widget buildSpacer(double value) =>
      SliverToBoxAdapter(child: MySizebox.getVerticalSizedBox(value));
}

class SwiperBuilder extends StatelessWidget {
  const SwiperBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220, // Set a specific height for the container
      width: double.infinity, // Set the width to match the parent
      child: Swiper(
        itemWidth: 380,
        itemHeight: 220,
        loop: true,
        duration: 300,
        scrollDirection: Axis.horizontal,
        curve: Curves.easeInOut,
        layout: SwiperLayout.STACK,
        itemCount: 3,
        itemBuilder: (context, index) {
          return buildBookingCard(context);
        },
      ),
    );
  }

  CustomLayoutOption buildCustom() => CustomLayoutOption(
      // Which index is the first item of array below
      startIndex: -1,
      // array length
      stateCount: 3)
    ..addRotate([
      // rotation of every item
      -45.0 / 180,
      0.0,
      45.0 / 180
    ])
    ..addTranslate([
      // offset of every item
      Offset(-370.0, -40.0),
      Offset(0.0, 0.0),
      Offset(370.0, -40.0)
    ]);

  Widget buildBookingCard(BuildContext context) => BookingCard();
}

class ListHiverTinderCard extends StatelessWidget {
  const ListHiverTinderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Set a specific height for the container
      width: double.infinity, // Set the width to match the parent
      child: Swiper(
        itemWidth: 380,
        itemHeight: 200,
        loop: true,
        duration: 300,
        scrollDirection: Axis.horizontal,
        curve: Curves.easeInOut,
        layout: SwiperLayout.STACK,
        itemCount: 3,
        itemBuilder: (context, index) {
          return buildHiverCard();
        },
      ),
    );
  }

  Widget buildHiverCard() => HiverCard();
}
