import 'package:beerescue_mobile/features/controller/provider/filtering-provider.dart';
import 'package:beerescue_mobile/features/view/components/button/default-button.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../shared/constant/size-constant.dart';
import '../../../../shared/style/mytext-style.dart';
import '../../../../shared/utils/mysizebox.dart';
import '../chip/sheet-chip.dart';

class FilterListHiverSheet extends StatelessWidget {
  const FilterListHiverSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
              const Center(child: SheetChip()),
              MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
              buildHeader(context),
              MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
              buildDistanceContainer(context),
              MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
              buildRatingContainer(context),
            ],
          ),
        ),
        buildButtons(context)
      ],
    );
  }

  Widget buildHeader(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizeConstant.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Filtering',
              style: MyTextStyle.getTitleStyle(
                  context, SizeConstant.fontSizeLg, context.onBackgroundColor),
            ),
            MySizebox.getVerticalSizedBox(SizeConstant.spaceSm),
            Text(
              'You can filtering the list hiver here.',
              style: MyTextStyle.getSubTitleStyle(
                  context, SizeConstant.fontSizeSm, context.onBackgroundColor),
            )
          ],
        ),
      );

  Widget buildDistanceContainer(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizeConstant.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Distance',
              style: MyTextStyle.getTitleStyle(
                  context, SizeConstant.fontSizeMd, context.onBackgroundColor),
            ),
            MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '0 km',
                  style: MyTextStyle.getSubTitleStyle(context,
                      SizeConstant.fontSizeMd, context.onBackgroundColor),
                ),
                Text(
                  '40 km',
                  style: MyTextStyle.getSubTitleStyle(context,
                      SizeConstant.fontSizeMd, context.onBackgroundColor),
                )
              ],
            ),
            Slider(
              min: 0.0,
              max: 1.0,
              label: 'Distance',
              value:
                  Provider.of<FilteringProvider>(context).currentValueDistance,
              onChanged: (value) {
                Provider.of<FilteringProvider>(context, listen: false)
                    .handleDistanceOnChanged(value);
              },
            )
          ],
        ),
      );

  Widget buildRatingContainer(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizeConstant.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Filter by Star Rating',
              style: MyTextStyle.getTitleStyle(
                  context, SizeConstant.fontSizeMd, context.onBackgroundColor),
            ),
            MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
            PannableRatingBar(
              spacing: 0.5,
              rate: Provider.of<FilteringProvider>(context).currentValueRating,
              maxRating: 5,
              minRating: 0,
              items: List.generate(
                  5,
                  (index) => RatingWidget(
                        selectedColor: context.primaryColor,
                        unSelectedColor: Colors.grey,
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: SizeConstant.sm),
                          child: Icon(
                            Icons.star,
                            size: SizeConstant.iconLg,
                          ),
                        ),
                      )),
              onChanged: (value) {
                Provider.of<FilteringProvider>(context, listen: false)
                    .handleRatingOnChanged(value);
              },
            ),
          ],
        ),
      );

  Widget buildButtons(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: SizeConstant.md, vertical: SizeConstant.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: DefaultButton(
                  buttonTitle: 'Clear',
                  buttonOnPressed: () {
                    Navigator.pop(context);
                    Provider.of<FilteringProvider>(context, listen: false)
                        .handleReset();
                  },
                  isPrimary: false),
            ),
            MySizebox.getHorizontalSizedBox(SizeConstant.spaceMd),
            Expanded(
              child: DefaultButton(
                  buttonTitle: 'Save', buttonOnPressed: () {}, isPrimary: true),
            )
          ],
        ),
      );
}
