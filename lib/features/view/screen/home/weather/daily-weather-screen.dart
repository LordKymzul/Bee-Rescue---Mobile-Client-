import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/constant/size-constant.dart';
import 'package:beerescue_mobile/shared/style/mytext-style.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class DailyWeatherScreen extends StatelessWidget {
  const DailyWeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return buildDailyCard(context);
      },
    );
  }

  Widget buildDailyCard(BuildContext context) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: SizeConstant.lg),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Tue',
                  style: MyTextStyle.getTitleStyle(context,
                      SizeConstant.fontSizeMd, context.onBackgroundColor),
                ),
                Icon(
                  Iconsax.cloud_copy,
                  color: context.primaryColor,
                ),
                Text(
                  '18C',
                  style: MyTextStyle.getTitleStyle(context,
                      SizeConstant.fontSizeMd, context.onBackgroundColor),
                ),
              ],
            ),
          ),
          Divider(
            color: context.secondaryVariantColor,
            thickness: 0.5,
          )
        ],
      );
}
