import 'package:beerescue_mobile/features/view/screen/credential/siginin-screen.dart';
import 'package:beerescue_mobile/features/view/screen/credential/signup/client-signup.dart';
import 'package:beerescue_mobile/features/view/screen/credential/signup/staff-signup.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/style/myappbar-style.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/constant/assets-constant.dart';
import '../../../../../shared/style/mypadding-style.dart';
import '../../../../../shared/style/mytext-style.dart';
import '../../../../../shared/utils/mysizebox.dart';
import '../../../components/button/default-button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      appBar: MyAppBarStyle.plainAppBar(context),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(child: buildHeader(context)),
                buildSilverAppBar(context)
              ];
            },
            body: TabBarView(children: [ClientSignUp(), StaffSignUp()])),
      ),
    );
  }

  Widget buildHeader(BuildContext context) => Padding(
        padding: MyPaddingStyle.getDefaultPadding(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              AssetsConstant.logo,
              height: 100,
              width: 100,
            ),
            MySizebox.getVerticalSizedBox(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hey, Nice to meet you!',
                  style: MyTextStyle.getTitleStyle(
                      context, 18, context.onBackgroundColor),
                ),
                MySizebox.getVerticalSizedBox(5),
                Text(
                  'Create your account here.',
                  style: MyTextStyle.getSubTitleStyle(
                      context, 12, context.onBackgroundColor),
                )
              ],
            )
          ],
        ),
      );

  Widget buildSilverAppBar(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: context.backgroundColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      shape:
          Border(bottom: BorderSide(color: context.backgroundColor, width: 1)),
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: TabBar(
              indicatorColor: context.primaryColor,
              indicatorWeight: 5,
              tabs: [
                Tab(
                  child: Text('User',
                      style: MyTextStyle.getTitleStyle(
                          context, 14, context.onBackgroundColor)),
                ),
                Tab(
                  child: Text('Staff',
                      style: MyTextStyle.getTitleStyle(
                          context, 14, context.onBackgroundColor)),
                ),
              ])),
    );
  }
}
