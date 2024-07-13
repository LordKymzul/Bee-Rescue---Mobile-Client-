import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../shared/constant/size-constant.dart';
import '../../../../../shared/style/mytext-style.dart';

class HourlyWeatherScreen extends StatelessWidget {
  const HourlyWeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 24,
      itemBuilder: (context, index) {
        return buildHourlyCard(context);
      },
    );
  }

  Widget buildHourlyCard(BuildContext context) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: SizeConstant.lg),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '00:00',
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
