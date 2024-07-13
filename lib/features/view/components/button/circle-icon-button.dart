import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:flutter/material.dart';

import '../../../../shared/constant/size-constant.dart';

class CircleIconButton extends StatelessWidget {
  final IconData buttonIcon;
  final VoidCallback buttonOnPressed;
  const CircleIconButton(
      {super.key, required this.buttonIcon, required this.buttonOnPressed});

  @override
  Widget build(BuildContext context) {
    return buildCircleIconButton(context);
  }

  Widget buildCircleIconButton(BuildContext context) => Container(
        decoration:
            BoxDecoration(color: context.primaryColor, shape: BoxShape.circle),
        child: IconButton(
            onPressed: buttonOnPressed,
            icon: Icon(
              buttonIcon,
              size: SizeConstant.iconLg,
              color: context.onPrimaryColor,
            )),
      );
}
