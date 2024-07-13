import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/constant/size-constant.dart';
import 'package:flutter/material.dart';

import '../../../../shared/style/mytext-style.dart';
import '../../../../shared/utils/mysizebox.dart';

class DefaultInputForm extends StatelessWidget {
  final String formTitle;
  final Widget formContent;
  const DefaultInputForm(
      {super.key, required this.formTitle, required this.formContent});

  @override
  Widget build(BuildContext context) {
    return buildDefaultInputForm(context);
  }

  Widget buildDefaultInputForm(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            formTitle,
            style: MyTextStyle.getTitleStyle(
                context, SizeConstant.fontSizeMd, context.onBackgroundColor),
          ),
          MySizebox.getVerticalSizedBox(10),
          formContent
        ],
      );
}
