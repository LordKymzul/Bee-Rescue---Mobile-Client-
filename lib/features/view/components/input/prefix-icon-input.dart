import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/constant/size-constant.dart';
import 'package:beerescue_mobile/shared/style/mytext-style.dart';
import 'package:flutter/material.dart';

class PrefixIconInput extends StatelessWidget {
  final TextEditingController inputController;
  final IconData inputIcon;
  final String inputHint;
  const PrefixIconInput(
      {super.key,
      required this.inputController,
      required this.inputIcon,
      required this.inputHint});

  @override
  Widget build(BuildContext context) {
    return buildIconInput(context);
  }

  Widget buildIconInput(BuildContext context) {
    return TextField(
      controller: inputController,
      keyboardType: TextInputType.text,
      cursorColor: context.primaryColor,
      style: MyTextStyle.getTitleStyle(
          context, SizeConstant.fontSizeSm, context.onBackgroundColor),
      decoration: InputDecoration(
          hintText: inputHint,
          hintStyle: MyTextStyle.getSubTitleStyle(
              context, SizeConstant.fontSizeSm, context.onBackgroundColor),
          prefixIcon: Icon(
            inputIcon,
            color: context.primaryColor,
          ),
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: context.primaryColor, width: 2))),
    );
  }
}
