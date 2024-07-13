import 'package:beerescue_mobile/features/view/components/card/chat/message-card.dart';
import 'package:beerescue_mobile/features/view/components/card/util/default-card.dart';
import 'package:beerescue_mobile/features/view/components/card/util/entity-card.dart';
import 'package:beerescue_mobile/features/view/components/input/invisible-input.dart';
import 'package:beerescue_mobile/features/view/components/input/message-input.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/constant/assets-constant.dart';
import 'package:beerescue_mobile/shared/constant/words-constant.dart';
import 'package:beerescue_mobile/shared/utils/mysizebox.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import '../../../../../shared/constant/size-constant.dart';
import '../../../../../shared/style/myappbar-style.dart';
import '../../../../../shared/style/mytext-style.dart';
import '../../../components/chip/message-date-chip.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController inputTc = TextEditingController();

  List<Map<String, dynamic>> listMessage = [
    {
      "messageContent":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "messageAt": DateTime.now()
          .subtract(Duration(days: 1, hours: 3, minutes: 30)), // Yesterday
      "messageBy": "hakim"
    },
    {
      "messageContent":
          "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.",
      "messageAt": DateTime.now().subtract(
          Duration(days: 2, hours: 1, minutes: 15)), // Day before yesterday
      "messageBy": "not hakim"
    },
    {
      "messageContent":
          "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.",
      "messageAt": DateTime.now().subtract(
          Duration(days: 2, hours: 1, minutes: 15)), // Day before yesterday
      "messageBy": "hakim"
    },
    {
      "messageContent":
          "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.",
      "messageAt": DateTime.now().subtract(
          Duration(days: 2, hours: 1, minutes: 15)), // Day before yesterday
      "messageBy": "hakim"
    },
    {
      "messageContent":
          "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      "messageAt": DateTime.now()
          .subtract(Duration(days: 0, hours: 4, minutes: 50)), // Today
      "messageBy": "hakim"
    },
    {
      "messageContent":
          "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "messageAt": DateTime.now()
          .subtract(Duration(days: 1, hours: 6, minutes: 10)), // Yesterday
      "messageBy": "not hakim"
    },
    {
      "messageContent":
          "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "messageAt": DateTime.now()
          .subtract(Duration(days: 1, hours: 6, minutes: 10)), // Yesterday
      "messageBy": "not hakim"
    }
  ];

  void main() {
    print(listMessage);
  }

  @override
  void dispose() {
    inputTc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      appBar: buildAppBar(),
      body: Column(
        children: [
          Expanded(child: buildListMessageCard()),
          buildMessageInput()
        ],
      ),
    );
  }

  AppBar buildAppBar() => MyAppBarStyle.defaultAppBar(
      context,
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: context.onBackgroundColor,
              )),
          Expanded(
            child: EntityCard(
                title: 'Irfan Ghaphar',
                desc: 'Online',
                imagePath: AssetsConstant.dpIrfan),
          )
        ],
      ));

  Widget buildListMessageCard() => GroupedListView(
        //controller: scrollController,
        reverse: true,
        order: GroupedListOrder.DESC,
        elements: listMessage,
        groupBy: (element) {
          DateTime messageAt = element['messageAt'];
          return DateTime(messageAt.year, messageAt.month, messageAt.day);
        },
        groupHeaderBuilder: (element) => Center(
            child: MessageDateChip(
          dateTime: element['messageAt'],
        )),
        indexedItemBuilder: (context, element, index) {
          return buildMessageCard(element);
        },
      );

  Widget buildMessageCard(Map<String, dynamic> eachMessage) => Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: SizeConstant.md, vertical: SizeConstant.sm),
        child: MessageCard(
          eachMessage: eachMessage,
        ),
      );

  Widget buildMessageInput() => Padding(
        padding: const EdgeInsets.only(
            left: SizeConstant.md,
            right: SizeConstant.md,
            bottom: SizeConstant.md),
        child: MessageInput(
          inputTc: inputTc,
          onSend: () {},
          onTap: () {},
        ),
      );
}
