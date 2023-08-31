import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/presentation/index.dart';
import '../blocs/chat/chat_bloc.dart';
import '../index.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChatAppBar(),
      body: BlocConsumer<ChatBloc, ChatState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ChatLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ChatLoadedState) {
            return MessageBody(messages: state.chat.messages!);
          } else {
            return const AlertError();
          }
        },
      ),
    );
  }
}
