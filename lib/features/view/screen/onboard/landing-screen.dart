import 'package:beerescue_mobile/features/view/components/button/default-button.dart';
import 'package:beerescue_mobile/features/view/screen/credential/siginin-screen.dart';
import 'package:beerescue_mobile/features/view/screen/credential/signup/signup-screen.dart';
import 'package:beerescue_mobile/features/view/screen/onboard/intro/first-onboard-screen.dart';
import 'package:beerescue_mobile/features/view/screen/onboard/intro/onboarding-screen.dart';
import 'package:beerescue_mobile/features/view/screen/onboard/intro/second-onboard-screen.dart';
import 'package:beerescue_mobile/features/view/screen/onboard/intro/third-onboard-screen.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/constant/assets-constant.dart';
import 'package:beerescue_mobile/shared/constant/words-constant.dart';
import 'package:beerescue_mobile/shared/style/mypadding-style.dart';
import 'package:beerescue_mobile/shared/style/mytext-style.dart';
import 'package:beerescue_mobile/shared/utils/mysizebox.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../shared/constant/size-constant.dart';
import '../../components/button/circle-icon-button.dart';
import '../main-screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final PageController pageController = PageController();
  bool onLastPage = false;

  void setNextPage() {
    pageController.nextPage(
        duration: const Duration(microseconds: 500), curve: Curves.easeIn);
  }

  void setSkip() {
    pageController.jumpToPage(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (value) {
                setState(() {
                  onLastPage = (value == 2);
                });
              },
              children: [
                buildContent(),
                FirstOnboardScreen(),
                SecondOnboardScreen(),
                ThirdOnboardScreen()
              ],
            ),
          ),
          buildBottom(),
        ],
      ),
    );
  }

  Widget buildBottom() => Padding(
        padding: const EdgeInsets.only(
          bottom: SizeConstant.lg,
          left: SizeConstant.md,
          right: SizeConstant.md,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SmoothPageIndicator(
              controller: pageController,
              count: 4,
              effect: ExpandingDotsEffect(
                  activeDotColor: context.primaryColor, dotHeight: 6),
            ),
            MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
            buildBottons()
          ],
        ),
      );

  Widget buildContent() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildImage(),
          MySizebox.getVerticalSizedBox(40),
          buildMiddle(context),
        ],
      );

  Widget buildImage() => Center(
        child: Image.asset(
          AssetsConstant.beehive_landing,
          height: 400,
          width: 400,
        ),
      );

  Widget buildMiddle(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizeConstant.md),
        child: Column(
          children: [
            Text(
              WordsConstant.titleLanding,
              style: MyTextStyle.getTitleStyle(
                  context, SizeConstant.fontSizeXlg, context.onBackgroundColor),
              textAlign: TextAlign.center,
            ),
            MySizebox.getVerticalSizedBox(10),
            Text(
              WordsConstant.descLanding,
              style: MyTextStyle.getSubTitleStyle(
                  context, SizeConstant.fontSizeMd, context.onBackgroundColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );

  Widget buildBottons() => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: DefaultButton(
                buttonTitle: 'Login',
                buttonOnPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SignInScreen(),
                  ));
                },
                isPrimary: true),
          ),
          MySizebox.getHorizontalSizedBox(SizeConstant.spaceMd),
          Expanded(
            child: DefaultButton(
                buttonTitle: 'Register',
                buttonOnPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SignUpScreen(),
                  ));
                },
                isPrimary: false),
          )
        ],
      );
}
