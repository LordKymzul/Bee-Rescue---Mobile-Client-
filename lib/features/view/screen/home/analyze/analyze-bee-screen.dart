import 'package:beerescue_mobile/features/view/components/button/container-button.dart';
import 'package:beerescue_mobile/features/view/components/button/default-button.dart';
import 'package:beerescue_mobile/features/view/screen/home/analyze/result-analyze-screen.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/style/myappbar-style.dart';
import 'package:beerescue_mobile/shared/utils/mysizebox.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../shared/constant/size-constant.dart';
import '../../../../../shared/style/mytext-style.dart';

class AnalyzeBeeScreen extends StatefulWidget {
  const AnalyzeBeeScreen({super.key});

  @override
  State<AnalyzeBeeScreen> createState() => _AnalyzeBeeScreenState();
}

class _AnalyzeBeeScreenState extends State<AnalyzeBeeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      appBar: buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
                buildHeader(),
                MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
                buildContainerUploadCard(),
              ],
            ),
          ),
          buildAnalyzeButton()
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
            'Analyze Bee',
            style: MyTextStyle.getTitleStyle(
                context, SizeConstant.fontSizeLg, context.onBackgroundColor),
          )
        ],
      ));

  Widget buildHeader() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizeConstant.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Examine Bee Species',
              style: MyTextStyle.getTitleStyle(
                  context, SizeConstant.fontSizeLg, context.onBackgroundColor),
            ),
            MySizebox.getVerticalSizedBox(SizeConstant.spaceSm),
            Text(
              'AI-Powered Bee analysis and classification for species.',
              style: MyTextStyle.getSubTitleStyle(
                  context, SizeConstant.fontSizeSm, context.onBackgroundColor),
            )
          ],
        ),
      );

  Widget buildContainerUploadCard() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizeConstant.md),
        child: Column(
          children: [
            ContainerButton(
              title: 'Upload From Camera',
              iconData: Iconsax.camera_copy,
              onPressed: () {},
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: SizeConstant.lg),
              child: Text(
                'OR',
                style: MyTextStyle.getTitleStyle(context,
                    SizeConstant.fontSizeLg, context.onBackgroundColor),
              ),
            ),
            ContainerButton(
              title: 'Upload From Gallery',
              iconData: Iconsax.gallery_copy,
              onPressed: () {},
            ),
          ],
        ),
      );

  Widget buildAnalyzeButton() => Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: SizeConstant.md, vertical: SizeConstant.md),
        child: DefaultButton(
          buttonTitle: 'Analyze',
          buttonOnPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ResultAnalyzeScreen(),
            ));
          },
          isPrimary: true,
        ),
      );
}
