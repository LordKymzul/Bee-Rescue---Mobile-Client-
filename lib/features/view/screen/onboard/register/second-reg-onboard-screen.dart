import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../../../../shared/constant/size-constant.dart';
import '../../../../../shared/style/myappbar-style.dart';
import '../../../../../shared/style/mytext-style.dart';
import '../../../../../shared/utils/mysizebox.dart';

class SecondRegOnboardScreen extends StatefulWidget {
  const SecondRegOnboardScreen({super.key});

  @override
  State<SecondRegOnboardScreen> createState() => _SecondRegOnboardScreenState();
}

class _SecondRegOnboardScreenState extends State<SecondRegOnboardScreen> {
  int age = 0;

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
          buildAgePicker()
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
              'How old are you?',
              style: MyTextStyle.getTitleStyle(
                  context, SizeConstant.fontSizeLg, context.onBackgroundColor),
              textAlign: TextAlign.center,
            ),
            MySizebox.getVerticalSizedBox(SizeConstant.spaceSm),
            Text(
              'To enhance Your Experience, Please Share Your Age',
              style: MyTextStyle.getSubTitleStyle(
                  context, SizeConstant.fontSizeMd, context.onBackgroundColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );

  Widget buildAgePicker() => NumberPicker(
        itemCount: 5,
        value: age,
        minValue: 0,
        maxValue: 100,
        onChanged: (value) => setState(() => age = value),
        selectedTextStyle: MyTextStyle.getTitleStyle(
            context, SizeConstant.fontSizeXlg, context.primaryColor),
        textStyle: MyTextStyle.getTitleStyle(
            context, SizeConstant.fontSizeLg, context.greyColor),
      );
}
