import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/constant/size-constant.dart';
import 'package:flutter/material.dart';

import '../../../../shared/style/mytext-style.dart';

class DefaultButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback buttonOnPressed;
  final bool isPrimary;
  const DefaultButton(
      {super.key,
      required this.buttonTitle,
      required this.buttonOnPressed,
      required this.isPrimary});

  @override
  Widget build(BuildContext context) {
    return buildDefaultButton(context);
  }

  Widget buildDefaultButton(BuildContext context) => ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
              isPrimary ? context.primaryColor : context.backgroundColor),
          padding: const MaterialStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 12, vertical: 12)),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              side: BorderSide(
                  color: isPrimary
                      ? context.primaryColor
                      : context.secondaryVariantColor,
                  width: 1),
              borderRadius: BorderRadius.circular(SizeConstant.md)))),
      onPressed: buttonOnPressed,
      child: Center(
        child: Text(
          buttonTitle,
          style: MyTextStyle.getTitleStyle(context, SizeConstant.fontSizeMd,
              isPrimary ? context.onPrimaryColor : context.onBackgroundColor),
        ),
      ));
}
