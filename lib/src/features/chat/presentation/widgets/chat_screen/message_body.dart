import 'package:flutter/material.dart';

import '../../../domain/entities/index.dart';
import '../../index.dart';

class MessageBody extends StatelessWidget {
  const MessageBody({super.key, required this.messages});

  final List<Message> messages;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return MessageBubble(message: messages[index]);
                },
                padding: EdgeInsets.zero,
                shrinkWrap: true,
              ),
            ),
            const SendInput(),
          ],
        ),
      ),
    );
  }
}
