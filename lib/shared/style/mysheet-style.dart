import 'package:beerescue_mobile/features/view/components/sheet/filter-list-hiver-sheet.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:flutter/material.dart';

import '../constant/size-constant.dart';

class MySheetStyle {
  static defaultBottomSheet(BuildContext context, Widget content, double height,
      Function? onCloseCallback) {
    return showModalBottomSheet(
      backgroundColor: context.backgroundColor,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(SizeConstant.md),
              topLeft: Radius.circular(SizeConstant.md))),
      context: context,
      builder: (context) {
        return SizedBox(width: double.infinity, height: height, child: content);
      },
    ).whenComplete(() {
      if (onCloseCallback != null) {
        onCloseCallback();
      }
    });
  }

  static filterListHiverSheet(BuildContext context, double height,
      double currentValueDistance, void Function(double)? onChanged) {
    return showModalBottomSheet(
      backgroundColor: context.backgroundColor,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(SizeConstant.md),
              topLeft: Radius.circular(SizeConstant.md))),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return SizedBox(
                width: double.infinity, height: height, child: Container());
          },
        );
      },
    );
  }
}
