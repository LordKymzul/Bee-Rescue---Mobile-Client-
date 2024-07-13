import 'package:beerescue_mobile/features/view/components/button/default-button.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/constant/assets-constant.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../shared/constant/size-constant.dart';
import '../../../../../shared/style/myappbar-style.dart';
import '../../../../../shared/style/mytext-style.dart';
import '../../../../../shared/utils/mysizebox.dart';

class ThirdRegOnboardScreen extends StatelessWidget {
  const ThirdRegOnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      appBar: buildAppBar(context),
      body: Center(
        child: Column(
          children: [
            MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
            buildHeader(context),
            MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
            Image.asset(
              AssetsConstant.accessLocation,
              height: 300,
              width: 300,
            ),
            MySizebox.getVerticalSizedBox(64),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: SizeConstant.md),
              child: DefaultButton(
                  buttonTitle: 'Enable Location',
                  buttonOnPressed: () {},
                  isPrimary: true),
            )
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) =>
      MyAppBarStyle.plainAppBar(context);

  Widget buildHeader(BuildContext context) => Center(
        child: Column(
          children: [
            Text(
              'Access your location',
              style: MyTextStyle.getTitleStyle(
                  context, SizeConstant.fontSizeLg, context.onBackgroundColor),
              textAlign: TextAlign.center,
            ),
            MySizebox.getVerticalSizedBox(SizeConstant.spaceSm),
            Text(
              'To enhance Your Experience, Please Share Your Current Location',
              style: MyTextStyle.getSubTitleStyle(
                  context, SizeConstant.fontSizeMd, context.onBackgroundColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
}
