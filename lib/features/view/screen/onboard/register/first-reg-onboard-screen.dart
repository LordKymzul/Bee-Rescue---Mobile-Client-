import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/utils/mysizebox.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../shared/constant/size-constant.dart';
import '../../../../../shared/style/myappbar-style.dart';
import '../../../../../shared/style/mytext-style.dart';

class FirstRegOnboardScreen extends StatefulWidget {
  const FirstRegOnboardScreen({super.key});

  @override
  State<FirstRegOnboardScreen> createState() => _FirstRegOnboardScreenState();
}

class _FirstRegOnboardScreenState extends State<FirstRegOnboardScreen> {
  List listGender = [
    ['Male', Icons.male, true],
    ['Female', Icons.female, false]
  ];

  void handleSelectGender(int currentIndex) {
    setState(() {
      for (int i = 0; i < listGender.length; i++) {
        listGender[i][2] = false;
      }
      listGender[currentIndex][2] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      appBar: buildAppBar(context),
      body: Column(
        children: [
          MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
          buildHeader(context),
          MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
          Column(
            children: listGender.asMap().entries.map((entry) {
              int index = entry.key;
              return buildGenderButton(entry.value, index);
            }).toList(),
          )
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) =>
      MyAppBarStyle.plainAppBar(context);

  Widget buildHeader(BuildContext context) => Center(
        child: Column(
          children: [
            Text(
              'Tell us about yourself',
              style: MyTextStyle.getTitleStyle(
                  context, SizeConstant.fontSizeLg, context.onBackgroundColor),
              textAlign: TextAlign.center,
            ),
            MySizebox.getVerticalSizedBox(SizeConstant.spaceSm),
            Text(
              'To enhance Your Experience, Please Share Your Gender',
              style: MyTextStyle.getSubTitleStyle(
                  context, SizeConstant.fontSizeMd, context.onBackgroundColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );

  Widget buildGenderButton(final eachGender, int currentIndex) => Padding(
        padding: const EdgeInsets.symmetric(vertical: SizeConstant.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                handleSelectGender(currentIndex);
              },
              borderRadius: BorderRadius.circular(100),
              child: Container(
                padding: const EdgeInsets.all(SizeConstant.lg),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: eachGender[2]
                        ? context.primaryColor.withOpacity(0.3)
                        : context.greyColor),
                child: Icon(
                  eachGender[1],
                  color: eachGender[2] ? context.primaryColor : Colors.white,
                  size: SizeConstant.iconLg,
                ),
              ),
            ),
            MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
            Text(
              eachGender[0],
              style: MyTextStyle.getTitleStyle(
                  context,
                  SizeConstant.fontSizeLg,
                  eachGender[2]
                      ? context.primaryColor
                      : context.onBackgroundColor),
            )
          ],
        ),
      );
}
