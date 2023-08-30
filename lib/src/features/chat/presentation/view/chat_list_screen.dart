import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/presentation/index.dart';
import '../blocs/chat_list/chat_list_bloc.dart';
import '../index.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        elevation: 0,
        centerTitle: true,
      ),
      body: BlocBuilder<ChatListBloc, ChatListState>(
        builder: (context, state) {
          if (state is ChatListLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ChatListLoadedState) {
            final chats = state.chats;
            return ChatList(chats: chats);
          } else {
            return const AlertError();
          }
        },
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
