import 'package:beerescue_mobile/features/view/components/card/util/default-card.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/constant/words-constant.dart';
import 'package:beerescue_mobile/shared/style/mytext-style.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../shared/animation/fade-animation.dart';
import '../../../../../shared/constant/size-constant.dart';
import '../../../components/card/chat/chat-card.dart';
import '../chats/chat-detail-screen.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: 30,
      itemBuilder: (context, index) {
        return MyFadeAnimation((0.5 + index), buildNotiCard(context));
      },
    ));
  }

  Widget buildNotiCard(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: SizeConstant.md, vertical: SizeConstant.sm),
        child: DefaultCard(
          content: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              padding: const EdgeInsets.all(SizeConstant.md),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.primaryColor.withOpacity(0.2)),
              child: Icon(
                Iconsax.folder,
                color: context.primaryColor,
              ),
            ),
            title: Text(
              'New Case Created',
              style: MyTextStyle.getTitleStyle(
                  context, SizeConstant.fontSizeMd, context.onBackgroundColor),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: SizeConstant.xs),
              child: Text(
                WordsConstant.loremExample,
                style: MyTextStyle.getSubTitleStyle(context,
                    SizeConstant.fontSizeSm, context.onBackgroundColor),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            trailing: Text(
              '27 May 2024',
              style: MyTextStyle.getTitleStyle(
                  context, SizeConstant.fontSizeSm, context.onBackgroundColor),
            ),
          ),
        ),
      );
}
