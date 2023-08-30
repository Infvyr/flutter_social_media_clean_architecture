import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' show DateFormat;

import '../../../../constants/index.dart';
import '../../domain/entities/index.dart';

class ChatListItem extends StatelessWidget {
  const ChatListItem({super.key, required this.chat});

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    final message = chat.messages!.reversed.first;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: Colors.grey,
        backgroundImage: AssetImage(chat.otherUser.avatarUrl!),
        radius: 25,
      ),
      title: Text(
        chat.otherUser.name.value,
        style: Theme.of(context).textTheme.titleSmall,
      ),
      subtitle: Text(
        message.content,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.labelSmall,
      ),
      trailing: Text(
        DateFormat('h:mm a').format(DateTime.parse(message.createdAt)),
        style: Theme.of(context).textTheme.labelSmall,
      ),
      onTap: () {
        context.go(
          context.namedLocation(
            AppRoutes.userChat.name,
            pathParameters: {
              '${AppRoutes.userChat.name}Id': chat.id,
            },
          ),
        );
      },
    );
  }
}
