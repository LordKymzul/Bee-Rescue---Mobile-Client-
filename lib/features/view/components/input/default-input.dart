import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/constant/size-constant.dart';
import 'package:flutter/material.dart';

import '../../../../shared/style/mytext-style.dart';

class DefaultInput extends StatelessWidget {
  final TextEditingController inputController;
  final String inputHint;
  final TextInputType inputType;
  const DefaultInput(
      {super.key,
      required this.inputController,
      required this.inputHint,
      required this.inputType});

  @override
  Widget build(BuildContext context) {
    return buildDefaultInput(context);
  }

  Widget buildDefaultInput(BuildContext context) {
    return TextField(
      controller: inputController,
      keyboardType: inputType,
      cursorColor: context.primaryColor,
      style: MyTextStyle.getTitleStyle(
          context, SizeConstant.fontSizeMd, context.onBackgroundColor),
      decoration: InputDecoration(
          hintText: inputHint,
          hintStyle: MyTextStyle.getSubTitleStyle(
              context, SizeConstant.fontSizeMd, context.onBackgroundColor),
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: context.greyColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: context.primaryColor, width: 2))),
    );
  }
}
