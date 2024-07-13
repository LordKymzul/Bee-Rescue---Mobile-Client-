import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../shared/constant/size-constant.dart';
import '../../../../shared/style/mytext-style.dart';
import '../../../../shared/utils/mysizebox.dart';

class SearchInput extends StatelessWidget {
  final String searchInputTitle;
  final Function(String)? searchInputOnChanged;

  const SearchInput({
    super.key,
    required this.searchInputTitle,
    required this.searchInputOnChanged,
  });

  @override
  Widget build(BuildContext context) {
    return buildSearchField(context);
  }

  Widget buildSearchField(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(
            horizontal: SizeConstant.md, vertical: SizeConstant.sm),
        decoration: BoxDecoration(
            color: context.backgroundColor,
            borderRadius: BorderRadius.circular(SizeConstant.xl),
            border: Border.all(color: context.secondaryVariantColor)),
        child: Row(
          children: [
            Icon(
              Iconsax.search_normal_1_copy,
              color: context.secondaryVariantColor,
            ),
            MySizebox.getHorizontalSizedBox(SizeConstant.spaceMd),
            Expanded(
              child: TextField(
                style: MyTextStyle.getTitleStyle(context,
                    SizeConstant.fontSizeMd, context.onBackgroundColor),
                keyboardType: TextInputType.text,
                onChanged: searchInputOnChanged,
                decoration: InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    hintText: searchInputTitle,
                    hintStyle: MyTextStyle.getSubTitleStyle(context,
                        SizeConstant.fontSizeMd, context.onBackgroundColor)),
              ),
            ),
          ],
        ),
      );
}
