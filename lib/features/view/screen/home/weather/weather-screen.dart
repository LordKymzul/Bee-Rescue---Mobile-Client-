import 'package:beerescue_mobile/features/view/screen/home/weather/daily-weather-screen.dart';
import 'package:beerescue_mobile/features/view/screen/home/weather/hourly-weather-screen.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/utils/mysizebox.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../shared/constant/size-constant.dart';
import '../../../../../shared/style/myappbar-style.dart';
import '../../../../../shared/style/mytext-style.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.backgroundColor,
        appBar: buildAppBar(context),
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverToBoxAdapter(child: buildHeader()),
                  buildSilverAppBar(context)
                ];
              },
              body: const TabBarView(
                  children: [HourlyWeatherScreen(), DailyWeatherScreen()])),
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
            'Weather',
            style: MyTextStyle.getTitleStyle(
                context, SizeConstant.fontSizeLg, context.onBackgroundColor),
          )
        ],
      ));

  Widget buildHeader() => Center(
        child: Container(
          padding: const EdgeInsets.all(SizeConstant.xl),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: context.primaryColor, width: 4)),
          child: Column(
            children: [
              Icon(
                Iconsax.cloud_copy,
                size: SizeConstant.iconLg,
                color: context.primaryColor,
              ),
              MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
              Text(
                '32',
                style: MyTextStyle.getTitleStyle(context,
                    SizeConstant.fontSizeXXlg, context.onBackgroundColor),
              ),
              MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
              Text(
                'Humidity 84%',
                style: MyTextStyle.getSubTitleStyle(context,
                    SizeConstant.fontSizeMd, context.onBackgroundColor),
              ),
            ],
          ),
        ),
      );

  Widget buildSilverAppBar(BuildContext context) {
    return MyAppBarStyle.buildSilverAppBar(context, [
      Tab(
        child: Text('Hourly',
            style: MyTextStyle.getTitleStyle(
                context, 14, context.onBackgroundColor)),
      ),
      Tab(
        child: Text('Daily',
            style: MyTextStyle.getTitleStyle(
                context, 14, context.onBackgroundColor)),
      ),
    ]);
  }
}
