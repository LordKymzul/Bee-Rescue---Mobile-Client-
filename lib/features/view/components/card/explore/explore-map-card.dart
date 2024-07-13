import 'package:beerescue_mobile/features/view/components/button/default-button.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/utils/calculation.s.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../shared/constant/assets-constant.dart';
import '../../../../../shared/constant/size-constant.dart';
import '../../../../../shared/style/mytext-style.dart';
import '../../../../../shared/utils/mysizebox.dart';
import '../review/user-rating-card.dart';
import '../util/avatar-card.dart';
import '../util/default-card.dart';

class ExploreMapCard extends StatelessWidget {
  Map<String, dynamic> eachLocation;
  ExploreMapCard({super.key, required this.eachLocation});

  double handleCalculateDistance() {
    LatLng currentLatLng = const LatLng(3.2249922, 101.7192806);
    double distance = Calculation.calculateDistance(
      currentLatLng,
      LatLng(eachLocation['location']['latitude'],
          eachLocation['location']['longitude']),
    );

    return distance;
  }

  @override
  Widget build(BuildContext context) {
    return buildExploreMapCard(context);
  }

  Widget buildExploreMapCard(BuildContext context) => FittedBox(
        child: DefaultCard(
          content: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AvatarCard(
                  imagePath: AssetsConstant.avatarDummy, radius: 30),
              MySizebox.getHorizontalSizedBox(SizeConstant.spaceMd),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eachLocation['name'],
                    style: MyTextStyle.getTitleStyle(context,
                        SizeConstant.fontSizeMd, context.onBackgroundColor),
                  ),
                  MySizebox.getVerticalSizedBox(SizeConstant.spaceSm),
                  const UserRatingCard(),
                  MySizebox.getVerticalSizedBox(SizeConstant.spaceSm),
                  Text(
                    eachLocation['location']['address'],
                    style: MyTextStyle.getSubTitleStyle(context,
                        SizeConstant.fontSizeSm, context.onBackgroundColor),
                  ),
                ],
              ),
              MySizebox.getHorizontalSizedBox(SizeConstant.spaceMd),
              Text(
                '${handleCalculateDistance().toStringAsFixed(2)} km',
                style: MyTextStyle.getSubTitleStyle(context,
                    SizeConstant.fontSizeSm, context.onBackgroundColor),
              ),
            ],
          ),
        ),
      );
}
