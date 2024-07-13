import 'package:beerescue_mobile/features/view/components/button/default-button.dart';
import 'package:beerescue_mobile/features/view/components/card/analyze/tutorial-card.dart';
import 'package:beerescue_mobile/features/view/components/image/default-image.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/constant/assets-constant.dart';
import 'package:beerescue_mobile/shared/constant/words-constant.dart';
import 'package:beerescue_mobile/shared/utils/mysizebox.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/constant/size-constant.dart';
import '../../../../../shared/style/myappbar-style.dart';
import '../../../../../shared/style/mytext-style.dart';

class ResultAnalyzeScreen extends StatelessWidget {
  const ResultAnalyzeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.backgroundColor,
        appBar: buildAppBar(context),
        body: Column(
          children: [
            Expanded(
              child: DefaultTabController(
                  length: 2,
                  child: NestedScrollView(
                      headerSliverBuilder: (context, innerBoxIsScrolled) {
                        return [
                          SliverToBoxAdapter(child: buildHeader(context)),
                          buildSilverAppBar(context)
                        ];
                      },
                      body: const TabBarView(
                        children: [
                          ResultAnalyzePrecaution(),
                          ResultAnalyzeTutorial()
                        ],
                      ))),
            ),
            buildSaveButton()
          ],
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
            'Result Analyze',
            style: MyTextStyle.getTitleStyle(
                context, SizeConstant.fontSizeLg, context.onBackgroundColor),
          )
        ],
      ));

  Widget buildSilverAppBar(BuildContext context) {
    return MyAppBarStyle.buildSilverAppBar(context, [
      Tab(
        child: Text('Precaution',
            style: MyTextStyle.getTitleStyle(
                context, 14, context.onBackgroundColor)),
      ),
      Tab(
        child: Text('Tutorial',
            style: MyTextStyle.getTitleStyle(
                context, 14, context.onBackgroundColor)),
      ),
    ]);
  }

  Widget buildHeader(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: SizeConstant.md, vertical: SizeConstant.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kelulut Hive',
              style: MyTextStyle.getTitleStyle(
                  context, SizeConstant.fontSizeLg, context.onBackgroundColor),
            ),
            MySizebox.getVerticalSizedBox(SizeConstant.spaceSm),
            Text(
              'Here is your overview',
              style: MyTextStyle.getSubTitleStyle(
                  context, SizeConstant.fontSizeSm, context.onBackgroundColor),
            ),
            MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
            const DefaultImage(
                imagePath: AssetsConstant.banner,
                imageWidth: double.infinity,
                imageHeight: 200)
          ],
        ),
      );

  Widget buildSaveButton() => Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: SizeConstant.md, vertical: SizeConstant.sm),
        child: DefaultButton(
            buttonTitle: 'Save', buttonOnPressed: () {}, isPrimary: true),
      );
}

class ResultAnalyzePrecaution extends StatelessWidget {
  const ResultAnalyzePrecaution({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(SizeConstant.md),
      child: Text(
        WordsConstant.precaution,
        style: MyTextStyle.getSubTitleStyle(
            context, SizeConstant.fontSizeMd, context.onBackgroundColor),
      ),
    );
  }
}

class ResultAnalyzeTutorial extends StatelessWidget {
  const ResultAnalyzeTutorial({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConstant.md, vertical: SizeConstant.sm),
            child: TutorialCard());
      },
    );
  }
}
