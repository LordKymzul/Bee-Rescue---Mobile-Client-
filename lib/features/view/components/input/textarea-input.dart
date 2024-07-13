import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:flutter/material.dart';

import '../../../../shared/constant/size-constant.dart';
import '../../../../shared/style/mytext-style.dart';

class TextareaInput extends StatelessWidget {
  final TextEditingController inputTc;
  final String inputHint;
  final int inputMaxlines;
  const TextareaInput(
      {super.key,
      required this.inputTc,
      required this.inputHint,
      required this.inputMaxlines});

  @override
  Widget build(BuildContext context) {
    return buildTextareaInput(context);
  }

  Widget buildTextareaInput(BuildContext context) => TextField(
        controller: inputTc,
        keyboardType: TextInputType.text,
        style: MyTextStyle.getSubTitleStyle(
            context, SizeConstant.fontSizeMd, context.onBackgroundColor),
        maxLines: inputMaxlines,
        decoration: InputDecoration(
            hintText: inputHint,
            hintStyle: MyTextStyle.getSubTitleStyle(
                context, SizeConstant.fontSizeMd, context.onBackgroundColor),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: context.primaryColor),
                borderRadius: BorderRadius.circular(SizeConstant.md)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: context.greyColor),
                borderRadius: BorderRadius.circular(SizeConstant.md))),
      );
}
