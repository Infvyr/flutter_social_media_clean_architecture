import 'package:flutter/material.dart';

import '../../domain/entities/index.dart';
import '../index.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key, required this.chats});

  final List<Chat> chats;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return ChatListItem(chat: chat);
      },
      key: const Key('chat_list'),
      padding: const EdgeInsets.all(10.0),
      separatorBuilder: (_, index) {
        if (index < chats.length - 1) {
          return const Divider(color: Colors.white12);
        }
        return const SizedBox.shrink();
      },
      shrinkWrap: true,
    );
  }
}
