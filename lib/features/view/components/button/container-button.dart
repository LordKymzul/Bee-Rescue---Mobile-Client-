import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:flutter/material.dart';

import '../../../../shared/constant/size-constant.dart';
import '../../../../shared/style/mytext-style.dart';
import '../../../../shared/utils/mysizebox.dart';

class ContainerButton extends StatelessWidget {
  final String title;
  final IconData iconData;
  final VoidCallback onPressed;
  const ContainerButton(
      {super.key,
      required this.title,
      required this.iconData,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return buildUploadCard(context);
  }

  Widget buildUploadCard(BuildContext context) => InkWell(
        borderRadius: BorderRadius.circular(SizeConstant.md),
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(SizeConstant.xl),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SizeConstant.md),
              border: Border.all(color: context.primaryColor)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(SizeConstant.md),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.primaryColor.withOpacity(0.3)),
                child: Icon(
                  iconData,
                  color: context.primaryColor,
                ),
              ),
              MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
              Text(
                title,
                style: MyTextStyle.getTitleStyle(context,
                    SizeConstant.fontSizeSm, context.onBackgroundColor),
              )
            ],
          ),
        ),
      );
}
