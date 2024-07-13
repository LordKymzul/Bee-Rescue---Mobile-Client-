import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../shared/constant/size-constant.dart';
import '../../../../shared/utils/mysizebox.dart';
import 'invisible-input.dart';

class MessageInput extends StatelessWidget {
  final TextEditingController inputTc;
  final VoidCallback onSend, onTap;

  const MessageInput(
      {super.key,
      required this.inputTc,
      required this.onSend,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return buildMessageInput(context);
  }

  Widget buildMessageInput(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(
            horizontal: SizeConstant.md, vertical: SizeConstant.xs),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConstant.md),
            border: Border.all(color: context.greyColor)),
        child: Row(
          children: [
            GestureDetector(
              onTap: onTap,
              child: Icon(
                Iconsax.add_copy,
                color: context.primaryColor,
              ),
            ),
            MySizebox.getHorizontalSizedBox(SizeConstant.spaceMd),
            Expanded(
                flex: 3,
                child: InvisibleInput(
                  inputHint: 'Write your message here',
                  inputTc: inputTc,
                )),
            GestureDetector(
              onTap: onSend,
              child: Icon(
                Iconsax.send_1_copy,
                color: context.primaryColor,
              ),
            )
          ],
        ),
      );
}
