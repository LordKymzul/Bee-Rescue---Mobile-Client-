import 'package:beerescue_mobile/features/view/components/button/default-button.dart';
import 'package:beerescue_mobile/features/view/screen/main-screen.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/constant/assets-constant.dart';
import 'package:beerescue_mobile/shared/constant/size-constant.dart';
import 'package:beerescue_mobile/shared/constant/words-constant.dart';
import 'package:beerescue_mobile/shared/style/myappbar-style.dart';
import 'package:beerescue_mobile/shared/style/mytext-style.dart';
import 'package:beerescue_mobile/shared/utils/mysizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BookResultScreen extends StatelessWidget {
  const BookResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: SizeConstant.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildAsset(),
              MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
              buildDescription(context),
              MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
              buildButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAsset() => SvgPicture.asset(
        AssetsConstant.successBook,
        height: 300,
        width: 300,
      );

  Widget buildDescription(BuildContext context) => Column(
        children: [
          Text(
            WordsConstant.resultBookedTitle,
            style: MyTextStyle.getTitleStyle(
                context, SizeConstant.fontSizeXlg, context.onBackgroundColor),
            textAlign: TextAlign.center,
          ),
          MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
          Text(
            WordsConstant.resultBookedDesc,
            style: MyTextStyle.getSubTitleStyle(
                context, SizeConstant.fontSizeMd, context.onBackgroundColor),
            textAlign: TextAlign.center,
          ),
        ],
      );
//'Please be patient until your hiver come to your location.',
  Widget buildButton(BuildContext context) => DefaultButton(
      buttonTitle: 'Back to Home',
      buttonOnPressed: () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => MainScreen(),
            ),
            (route) => false);
      },
      isPrimary: true);
}
