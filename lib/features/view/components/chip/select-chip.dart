import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:flutter/material.dart';

import '../../../../shared/constant/size-constant.dart';
import '../../../../shared/style/mytext-style.dart';

class SelectChip extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  const SelectChip(
      {super.key,
      required this.title,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return buildCaseFilterChip(context);
  }

  Widget buildCaseFilterChip(BuildContext context) => InkWell(
        borderRadius: BorderRadius.circular(SizeConstant.xl),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: SizeConstant.xl, vertical: SizeConstant.sm),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SizeConstant.xl),
              border: Border.all(
                  color: isSelected
                      ? context.primaryColor
                      : context.secondaryVariantColor),
              color:
                  isSelected ? context.primaryColor : context.backgroundColor),
          child: Center(
            child: Text(
              title,
              style: MyTextStyle.getTitleStyle(
                  context,
                  SizeConstant.fontSizeMd,
                  isSelected
                      ? context.onPrimaryColor
                      : context.secondaryVariantColor),
            ),
          ),
        ),
      );
}
