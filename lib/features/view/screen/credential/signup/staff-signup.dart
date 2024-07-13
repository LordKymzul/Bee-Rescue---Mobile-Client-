import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/constant/size-constant.dart';
import '../../../../../shared/style/mytext-style.dart';
import '../../../../../shared/utils/mysizebox.dart';
import '../../../components/button/default-button.dart';

class StaffSignUp extends StatefulWidget {
  const StaffSignUp({super.key});

  @override
  State<StaffSignUp> createState() => _StaffSignUpState();
}

class _StaffSignUpState extends State<StaffSignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [],
            ),
          ),
          buildBottom(context)
        ],
      ),
    );
  }

  Widget buildBottom(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
        child: Column(
          children: [
            buildButton(),
            MySizebox.getVerticalSizedBox(10),
            buildFooter(context)
          ],
        ),
      );

  Widget buildButton() => DefaultButton(
        buttonTitle: 'Register',
        buttonOnPressed: () {},
        isPrimary: true,
      );

  Widget buildFooter(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Already have an account?',
            style: MyTextStyle.getSubTitleStyle(
                context, SizeConstant.fontSizeSm, context.onBackgroundColor),
          ),
          MySizebox.getHorizontalSizedBox(5),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              'Sign In Here',
              style: MyTextStyle.getTitleStyle(
                  context, SizeConstant.fontSizeSm, context.primaryColor),
            ),
          ),
        ],
      );
}
