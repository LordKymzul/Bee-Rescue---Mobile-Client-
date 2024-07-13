import 'package:beerescue_mobile/features/view/screen/messages/chats/chat-detail-screen.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/animation/fade-animation.dart';
import '../../../../../shared/constant/size-constant.dart';
import '../../../components/card/chat/chat-card.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: 30,
      itemBuilder: (context, index) {
        return MyFadeAnimation((0.5 + index), buildChatCard(context));
      },
    ));
  }

  Widget buildChatCard(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: SizeConstant.md, vertical: SizeConstant.md),
      child: ChatCard(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ChatDetailScreen(),
          ));
        },
      ));
}
