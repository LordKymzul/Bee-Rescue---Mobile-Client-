import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/constant/words-constant.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../shared/constant/assets-constant.dart';
import '../../../../../shared/constant/size-constant.dart';
import '../../../../../shared/style/mytext-style.dart';
import '../../../../../shared/utils/mysizebox.dart';

class SecondOnboardScreen extends StatelessWidget {
  const SecondOnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      body: buildContent(context),
    );
  }

  Widget buildContent(BuildContext context) => Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset(
              AssetsConstant.chat,
              height: 400,
              width: 400,
            ),
            MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
            buildTexts(context)
          ],
        ),
      );

  Widget buildTexts(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: SizeConstant.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                WordsConstant.secondOnboardTitle,
                style: MyTextStyle.getTitleStyle(context,
                    SizeConstant.fontSizeXXlg, context.onBackgroundColor),
                textAlign: TextAlign.center,
              ),
              MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
              Text(
                WordsConstant.secondOnboardDesc,
                style: MyTextStyle.getSubTitleStyle(context,
                    SizeConstant.fontSizeMd, context.onBackgroundColor),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
}
