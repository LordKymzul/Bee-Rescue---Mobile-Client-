import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../shared/constant/size-constant.dart';
import '../../../../../shared/style/mytext-style.dart';
import '../../../../../shared/utils/mysizebox.dart';

class DefaultCard extends StatelessWidget {
  final Widget content;
  const DefaultCard({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return buildDefaultCard(context);
  }

  Widget buildDefaultCard(BuildContext context) => Container(
      padding: const EdgeInsets.all(SizeConstant.md),
      decoration: BoxDecoration(
          color: context.backgroundColor,
          borderRadius: BorderRadius.circular(SizeConstant.md),
          border: Border.all(color: context.secondaryVariantColor)),
      child: content);
}
