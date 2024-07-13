import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:flutter/material.dart';

import '../../../../shared/constant/size-constant.dart';

class SheetChip extends StatelessWidget {
  const SheetChip({super.key});

  @override
  Widget build(BuildContext context) {
    return buildSheetChip(context);
  }

  Widget buildSheetChip(BuildContext context) => Container(
        height: 5,
        width: 100,
        decoration: BoxDecoration(
            color: context.greyColor,
            borderRadius: BorderRadius.circular(SizeConstant.xl)),
      );
}
