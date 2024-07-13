import 'package:beerescue_mobile/features/view/components/card/explore/hiver-card.dart';
import 'package:beerescue_mobile/features/view/components/input/search-input.dart';
import 'package:beerescue_mobile/features/view/components/sheet/filter-list-hiver-sheet.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/utils/mysizebox.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../../shared/constant/size-constant.dart';
import '../../../../../shared/style/myappbar-style.dart';
import '../../../../../shared/style/mysheet-style.dart';
import '../../../../../shared/style/mytext-style.dart';
import '../../../../controller/provider/filtering-provider.dart';
import '../../../components/sheet/locations-sheet.dart';

class ListHiverScreen extends StatefulWidget {
  const ListHiverScreen({super.key});

  @override
  State<ListHiverScreen> createState() => _ListHiverScreenState();
}

class _ListHiverScreenState extends State<ListHiverScreen> {
  double currentValueDistance = 0.4;

  void handleDistanceOnChanged(double value) {
    setState(() {
      currentValueDistance = value;
    });
  }

  void handleFilterBottomSheet() {
    MySheetStyle.defaultBottomSheet(context, FilterListHiverSheet(), 350, () {
      print('Reset');
      Provider.of<FilteringProvider>(context, listen: false).handleReset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      appBar: buildAppBar(context),
      body: Column(
        children: [
          MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
          buildSearchField(),
          MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
          Expanded(
              child: ListView.builder(
            itemCount: 30,
            itemBuilder: (context, index) {
              return buildHiverCard();
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
            'List of Hivers',
            style: MyTextStyle.getTitleStyle(
                context, SizeConstant.fontSizeLg, context.onBackgroundColor),
          )
        ],
      ));

  Widget buildSearchField() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizeConstant.md),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: SearchInput(
                searchInputTitle: 'Search hivers',
                searchInputOnChanged: (p0) {},
              ),
            ),
            MySizebox.getHorizontalSizedBox(SizeConstant.spaceMd),
            InkWell(
              onTap: () {
                handleFilterBottomSheet();
              },
              borderRadius: BorderRadius.circular(SizeConstant.xl),
              child: Container(
                padding: const EdgeInsets.all(SizeConstant.md),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: context.primaryColor),
                child: Icon(
                  Iconsax.filter_copy,
                  color: context.onPrimaryColor,
                  size: SizeConstant.iconMd,
                ),
              ),
            ),
          ],
        ),
      );
  Widget buildHiverCard() => Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: SizeConstant.md, vertical: SizeConstant.sm),
        child: HiverCard(),
      );
}
