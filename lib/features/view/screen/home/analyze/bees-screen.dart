import 'package:beerescue_mobile/features/view/components/card/analyze/bee-card.dart';
import 'package:beerescue_mobile/features/view/components/card/util/default-card.dart';
import 'package:beerescue_mobile/features/view/components/chip/status-chip.dart';
import 'package:beerescue_mobile/features/view/components/input/search-input.dart';
import 'package:beerescue_mobile/features/view/screen/home/analyze/analyze-bee-screen.dart';
import 'package:beerescue_mobile/main.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/constant/assets-constant.dart';
import 'package:beerescue_mobile/shared/constant/size-constant.dart';
import 'package:beerescue_mobile/shared/constant/words-constant.dart';
import 'package:beerescue_mobile/shared/style/myappbar-style.dart';
import 'package:beerescue_mobile/shared/style/mytext-style.dart';
import 'package:beerescue_mobile/shared/utils/mysizebox.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../shared/animation/fade-animation.dart';

class BeesScreen extends StatefulWidget {
  const BeesScreen({super.key});

  @override
  State<BeesScreen> createState() => _BeesScreenState();
}

class _BeesScreenState extends State<BeesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      appBar: buildAppBar(),
      floatingActionButton: buildFloatingActionButton(),
      body: Column(
        children: [
          MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
          buildSearchInput(),
          MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
          Expanded(
              child: ListView.builder(
            itemCount: 30,
            itemBuilder: (context, index) {
              return MyFadeAnimation((0.5 + index), buildBeeCard());
            },
          ))
        ],
      ),
    );
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
            'Detected Bees',
            style: MyTextStyle.getTitleStyle(
                context, SizeConstant.fontSizeLg, context.onBackgroundColor),
          )
        ],
      ));

  FloatingActionButton buildFloatingActionButton() => FloatingActionButton(
        backgroundColor: context.primaryColor,
        child: Icon(
          Iconsax.scan,
          color: context.onPrimaryColor,
        ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AnalyzeBeeScreen(),
          ));
        },
      );

  Widget buildSearchInput() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizeConstant.md),
        child: SearchInput(
          searchInputTitle: 'Search Your Bees...',
          searchInputOnChanged: (value) {},
        ),
      );

  Widget buildBeeCard() => const Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConstant.md, vertical: SizeConstant.sm),
        child: BeeCard(),
      );
}
