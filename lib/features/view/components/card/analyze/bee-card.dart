import 'package:beerescue_mobile/features/view/components/card/util/default-card.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../shared/constant/assets-constant.dart';
import '../../../../../shared/constant/size-constant.dart';
import '../../../../../shared/constant/words-constant.dart';
import '../../../../../shared/style/mytext-style.dart';
import '../../../../../shared/utils/mysizebox.dart';
import '../../chip/status-chip.dart';

class BeeCard extends StatelessWidget {
  const BeeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return buildBeeCard(context);
  }

  Widget buildBeeCard(BuildContext context) => DefaultCard(
        content: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            backgroundColor: context.primaryColor,
            backgroundImage: const AssetImage(AssetsConstant.avatarDummy),
            radius: 30,
          ),
          title: Text(
            'Kelulut',
            style: MyTextStyle.getTitleStyle(
                context, SizeConstant.fontSizeMd, context.onBackgroundColor),
          ),
          subtitle: Column(
            children: [
              MySizebox.getVerticalSizedBox(SizeConstant.spaceSm),
              Text(
                WordsConstant.loremExample,
                style: MyTextStyle.getSubTitleStyle(context,
                    SizeConstant.fontSizeSm, context.onBackgroundColor),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              MySizebox.getVerticalSizedBox(SizeConstant.spaceSm),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Iconsax.calendar_1_copy,
                        size: SizeConstant.iconSm,
                      ),
                      MySizebox.getHorizontalSizedBox(SizeConstant.spaceSm),
                      Text(
                        '19 Apr 2024',
                        style: MyTextStyle.getSubTitleStyle(context,
                            SizeConstant.fontSizeSm, context.onBackgroundColor),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Iconsax.clock_copy,
                        size: SizeConstant.iconSm,
                      ),
                      MySizebox.getHorizontalSizedBox(SizeConstant.spaceSm),
                      Text(
                        '18:00',
                        style: MyTextStyle.getSubTitleStyle(context,
                            SizeConstant.fontSizeSm, context.onBackgroundColor),
                      )
                    ],
                  ),
                  const StatusChip(status: 'Hive')
                ],
              )
            ],
          ),
        ),
      );
}
