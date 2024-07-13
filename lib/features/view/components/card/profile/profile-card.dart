import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../shared/constant/size-constant.dart';
import '../../../../../shared/style/mytext-style.dart';

class ProfileCard extends StatelessWidget {
  final String title;
  final IconData iconData;
  final VoidCallback onTap;
  const ProfileCard(
      {super.key,
      required this.title,
      required this.iconData,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return buildProfileCard(context);
  }

  Widget buildProfileCard(BuildContext context) => ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.zero,
        leading: Icon(
          iconData,
          color: context.onBackgroundColor,
        ),
        title: Text(
          title,
          style: MyTextStyle.getTitleStyle(
              context, SizeConstant.fontSizeMd, context.onBackgroundColor),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: context.onBackgroundColor,
          size: SizeConstant.iconSm,
        ),
      );
}
