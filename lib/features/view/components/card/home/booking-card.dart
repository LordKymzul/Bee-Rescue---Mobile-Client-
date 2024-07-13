import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../shared/constant/assets-constant.dart';
import '../../../../../shared/constant/size-constant.dart';
import '../../../../../shared/style/mytext-style.dart';
import '../../../../../shared/utils/mysizebox.dart';
import '../../../../../shared/utils/url-services.dart';
import '../../../screen/home/case/case-detail/case-detail-screen.dart';
import '../../button/default-button.dart';
import '../util/default-card.dart';
import '../util/entity-card.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return buildBookingCard(context);
  }

  Widget buildBookingCard(BuildContext context) => DefaultCard(
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildHeader(),
            MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
            buildDateTimeContainer(context),
            MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
            buildButtons(context)
          ],
        ),
      );

  Widget buildHeader() => const EntityCard(
        title: 'Irfan Ghaphar',
        desc: 'Hiver',
        imagePath: AssetsConstant.dpIrfan,
      );

  Widget buildDateTimeContainer(BuildContext context) => DefaultCard(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Iconsax.calendar_edit_copy,
                  color: context.primaryColor,
                ),
                MySizebox.getHorizontalSizedBox(SizeConstant.spaceMd),
                Text(
                  'Tue, 27 Nov',
                  style: MyTextStyle.getTitleStyle(context,
                      SizeConstant.fontSizeSm, context.onBackgroundColor),
                ),
              ],
            )),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Iconsax.clock_copy,
                  color: context.primaryColor,
                ),
                MySizebox.getHorizontalSizedBox(SizeConstant.spaceMd),
                Text(
                  '18:00',
                  style: MyTextStyle.getTitleStyle(context,
                      SizeConstant.fontSizeSm, context.onBackgroundColor),
                ),
              ],
            ))
          ],
        ),
      );
  Widget buildButtons(BuildContext context) => Row(
        children: [
          Expanded(
            child: DefaultButton(
                buttonTitle: 'Open in Maps',
                buttonOnPressed: () {
                  URLServices.goToMap(
                      context: context, lat: 3.221805, lng: 101.7256583);
                },
                isPrimary: false),
          ),
          MySizebox.getHorizontalSizedBox(SizeConstant.spaceMd),
          Expanded(
            child: DefaultButton(
                buttonTitle: 'See Details',
                buttonOnPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CaseDetailScreen(),
                  ));
                },
                isPrimary: true),
          ),
        ],
      );
}
