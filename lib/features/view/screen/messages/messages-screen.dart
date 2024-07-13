import 'package:beerescue_mobile/features/view/components/chip/select-chip.dart';
import 'package:beerescue_mobile/features/view/screen/messages/chats/chats-screen.dart';
import 'package:beerescue_mobile/features/view/screen/messages/notifications/notifications-screen.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/constant/size-constant.dart';
import 'package:beerescue_mobile/shared/style/myappbar-style.dart';
import 'package:beerescue_mobile/shared/style/mytext-style.dart';
import 'package:beerescue_mobile/shared/utils/mysizebox.dart';
import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  List listMessageTab = [
    ['Chats', true],
    ['Notifications', false]
  ];

  void handleSelectedMessageTab(int currentIndex) {
    setState(() {
      for (int i = 0; i < listMessageTab.length; i++) {
        listMessageTab[i][1] = false;
      }
      listMessageTab[currentIndex][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      appBar: buildAppBar(),
      body: Column(
        children: [
          MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
          buildHeader(),
          MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
          listMessageTab[0][1] ? ChatsScreen() : NotificationsScreen()
        ],
      ),
    );
  }

  AppBar buildAppBar() => MyAppBarStyle.defaultAppBar(
      context,
      Text(
        'Messages',
        style: MyTextStyle.getTitleStyle(
            context, SizeConstant.fontSizeXXlg, context.onBackgroundColor),
      ));

  Widget buildHeader() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizeConstant.md),
        child: Row(
          children: [
            Expanded(
              child: SelectChip(
                title: listMessageTab[0][0],
                isSelected: listMessageTab[0][1],
                onTap: () {
                  handleSelectedMessageTab(0);
                },
              ),
            ),
            MySizebox.getHorizontalSizedBox(SizeConstant.spaceMd),
            Expanded(
              child: SelectChip(
                title: listMessageTab[1][0],
                isSelected: listMessageTab[1][1],
                onTap: () {
                  handleSelectedMessageTab(1);
                },
              ),
            )
          ],
        ),
      );
}
