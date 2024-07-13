import 'package:beerescue_mobile/features/view/components/button/circle-icon-button.dart';
import 'package:beerescue_mobile/features/view/screen/credential/siginin-screen.dart';
import 'package:beerescue_mobile/features/view/screen/onboard/intro/first-onboard-screen.dart';
import 'package:beerescue_mobile/features/view/screen/onboard/intro/second-onboard-screen.dart';
import 'package:beerescue_mobile/features/view/screen/onboard/intro/third-onboard-screen.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/constant/size-constant.dart';
import 'package:beerescue_mobile/shared/style/mypadding-style.dart';
import 'package:beerescue_mobile/shared/style/mytext-style.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
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
      appBar: buildAppBar(),
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (value) {
              setState(() {
                onLastPage = (value == 2);
              });
            },
            children: [
              FirstOnboardScreen(),
              SecondOnboardScreen(),
              ThirdOnboardScreen()
            ],
          ),
          buildBottom()
        ],
      ),
    );
  }

  AppBar buildAppBar() => AppBar(
        backgroundColor: context.backgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                setSkip();
              },
              child: Text(
                'Skip',
                style: MyTextStyle.getTitleStyle(
                    context, SizeConstant.fontSizeMd, context.primaryColor),
              ))
        ],
      );

  Widget buildBottom() => Padding(
        padding: MyPaddingStyle.getDefaultPadding(),
        child: Container(
            alignment: const Alignment(0, 0.90),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count: 3,
                  effect: ExpandingDotsEffect(
                      activeDotColor: context.primaryColor, dotHeight: 6),
                ),
                onLastPage
                    ? CircleIconButton(
                        buttonIcon: Icons.done,
                        buttonOnPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => SignInScreen(),
                              ),
                              (route) => false);
                        })
                    : CircleIconButton(
                        buttonIcon: Icons.keyboard_arrow_right,
                        buttonOnPressed: () {
                          setNextPage();
                        })
              ],
            )),
      );
}
