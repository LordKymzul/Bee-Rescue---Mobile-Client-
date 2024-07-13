import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../shared/constant/size-constant.dart';
import '../../../../shared/style/mytext-style.dart';

class RoleChip extends StatelessWidget {
  final String role;
  const RoleChip({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return buildRoleChip(context);
  }

  Widget buildRoleChip(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(
            horizontal: SizeConstant.md, vertical: SizeConstant.xs),
        decoration: BoxDecoration(
            color: context.primaryColor.withOpacity(0.3),
            borderRadius: BorderRadius.circular(SizeConstant.xl)),
        child: Text(
          role,
          style: MyTextStyle.getTitleStyle(
              context, SizeConstant.fontSizeMd, context.primaryColor),
        ),
      );
}
