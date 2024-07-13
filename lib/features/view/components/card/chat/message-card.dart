import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/constant/assets-constant.dart';
import 'package:beerescue_mobile/shared/constant/size-constant.dart';
import 'package:beerescue_mobile/shared/constant/words-constant.dart';
import 'package:beerescue_mobile/shared/style/mytext-style.dart';
import 'package:beerescue_mobile/shared/utils/calculation.s.dart';
import 'package:beerescue_mobile/shared/utils/mysizebox.dart';
import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  final Map<String, dynamic> eachMessage;
  const MessageCard({super.key, required this.eachMessage});

  bool isUser() {
    if (eachMessage['messageBy'] == "hakim") {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildMessageContent(context),
        MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
        buildMessageAt(context)
      ],
    );
  }

  Widget buildMessageContent(BuildContext context) => Container(
        alignment: isUser() ? Alignment.topRight : Alignment.topLeft,
        margin: isUser()
            ? const EdgeInsets.only(left: 64)
            : const EdgeInsets.only(right: 64),
        padding: const EdgeInsets.all(SizeConstant.md),
        decoration: BoxDecoration(
            border: Border.all(
                color:
                    isUser() ? context.backgroundColor : context.primaryColor),
            borderRadius: BorderRadius.circular(SizeConstant.md),
            color: isUser() ? context.primaryColor : context.backgroundColor),
        child: Text(
          eachMessage['messageContent'],
          style: MyTextStyle.getTitleStyle(context, SizeConstant.fontSizeMd,
              isUser() ? context.onPrimaryColor : context.onBackgroundColor),
        ),
      );

  Widget buildMessageAt(BuildContext context) => Row(
        mainAxisAlignment:
            isUser() ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Text(
            Calculation.formatTimeNow(eachMessage['messageAt']),
            style: MyTextStyle.getSubTitleStyle(
                context, SizeConstant.fontSizeSm, context.onBackgroundColor),
          ),
        ],
      );
}
