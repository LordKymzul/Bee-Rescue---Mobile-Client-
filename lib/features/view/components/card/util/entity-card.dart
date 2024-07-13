import 'package:beerescue_mobile/features/view/components/card/util/avatar-card.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/constant/assets-constant.dart';
import '../../../../../shared/constant/size-constant.dart';
import '../../../../../shared/style/mytext-style.dart';

class EntityCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String desc;
  const EntityCard(
      {super.key,
      required this.title,
      required this.desc,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return buildUserCard(context);
  }

  Widget buildUserCard(BuildContext context) => ListTile(
        contentPadding: EdgeInsets.zero,
        leading: AvatarCard(imagePath: imagePath, radius: 25),
        title: Text(
          title,
          style: MyTextStyle.getTitleStyle(
              context, SizeConstant.fontSizeMd, context.onBackgroundColor),
        ),
        subtitle: Text(
          desc,
          style: MyTextStyle.getSubTitleStyle(
              context, SizeConstant.fontSizeMd, context.onBackgroundColor),
        ),
      );
}
