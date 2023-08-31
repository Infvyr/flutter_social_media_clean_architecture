import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/index.dart';
import '../../blocs/chat/chat_bloc.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final currentUserId = (context.read<ChatBloc>().state as ChatLoadedState).chat.currentUser.id;
    final sendFromMe = message.senderId == currentUserId;
    final alignment = sendFromMe ? Alignment.centerRight : Alignment.centerLeft;
    final color =
        message.senderId == currentUserId ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary;

    return Align(
      alignment: alignment,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: width * 0.66),
        child: Card(
          color: color,
          elevation: 1,
          margin: const EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: sendFromMe
                ? const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  )
                : const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Text(
              message.content,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
