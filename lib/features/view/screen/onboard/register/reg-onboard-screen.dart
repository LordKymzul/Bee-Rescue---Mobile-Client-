import 'package:beerescue_mobile/features/view/screen/main-screen.dart';
import 'package:beerescue_mobile/features/view/screen/onboard/register/first-reg-onboard-screen.dart';
import 'package:beerescue_mobile/features/view/screen/onboard/register/second-reg-onboard-screen.dart';
import 'package:beerescue_mobile/features/view/screen/onboard/register/third-reg-onboard-screen.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/constant/size-constant.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../shared/style/mypadding-style.dart';
import '../../../components/button/circle-icon-button.dart';

class RegOnboardScreen extends StatefulWidget {
  const RegOnboardScreen({super.key});

  @override
  State<RegOnboardScreen> createState() => _RegOnboardScreenState();
}

class _RegOnboardScreenState extends State<RegOnboardScreen> {
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
              FirstRegOnboardScreen(),
              SecondRegOnboardScreen(),
              ThirdRegOnboardScreen()
            ],
          ),
          buildBottom()
        ],
      ),
    );
  }

  Widget buildBottom() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizeConstant.md),
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
                                builder: (context) => MainScreen(),
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
