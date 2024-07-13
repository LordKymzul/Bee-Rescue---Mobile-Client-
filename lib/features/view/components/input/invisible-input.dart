import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:flutter/material.dart';

import '../../../../shared/constant/size-constant.dart';
import '../../../../shared/style/mytext-style.dart';

class InvisibleInput extends StatelessWidget {
  final TextEditingController? inputTc;
  final String inputHint;
  final Function(String)? inputOnChanged;
  const InvisibleInput(
      {super.key, this.inputTc, required this.inputHint, this.inputOnChanged});

  @override
  Widget build(BuildContext context) {
    return buildInvisibleInput(context);
  }

  Widget buildInvisibleInput(BuildContext context) => TextField(
        controller: inputTc,
        keyboardType: TextInputType.text,
        onChanged: inputOnChanged,
        style: MyTextStyle.getSubTitleStyle(
            context, SizeConstant.fontSizeMd, context.onBackgroundColor),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: inputHint,
            hintStyle: MyTextStyle.getSubTitleStyle(
                context, SizeConstant.fontSizeSm, context.onBackgroundColor)),
      );
}
