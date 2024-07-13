import 'package:beerescue_mobile/features/view/components/card/util/avatar-card.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/constant/assets-constant.dart';
import '../../../../../shared/constant/size-constant.dart';
import '../../../../../shared/constant/words-constant.dart';
import '../../../../../shared/style/mytext-style.dart';

class ChatCard extends StatelessWidget {
  final VoidCallback onTap;
  const ChatCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return buildChatCard(context);
  }

  Widget buildChatCard(BuildContext context) => InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(SizeConstant.md),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const AvatarCard(
              imagePath: AssetsConstant.avatarDummy, radius: 25),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Irfan Ghaphar',
                style: MyTextStyle.getTitleStyle(context,
                    SizeConstant.fontSizeMd, context.onBackgroundColor),
              ),
              Text(
                '29 May 20, 14:50',
                style: MyTextStyle.getSubTitleStyle(context,
                    SizeConstant.fontSizeSm, context.onBackgroundColor),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: SizeConstant.xs),
            child: Text(
              WordsConstant.loremExample,
              style: MyTextStyle.getSubTitleStyle(
                  context, SizeConstant.fontSizeSm, context.onBackgroundColor),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      );
}
