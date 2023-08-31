import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/index.dart';
import '../../../domain/usecases/index.dart';

part 'chat_list_event.dart';
part 'chat_list_state.dart';

class ChatListBloc extends Bloc<ChatListEvent, ChatListState> {
  final GetChatsByUser _getChatsByUser;

  ChatListBloc({required GetChatsByUser getChatsByUser})
      : _getChatsByUser = getChatsByUser,
        super(const ChatListLoadingState()) {
    on<ChatListLoadEvent>(_onLoadChats);
  }

  void _onLoadChats(
    ChatListLoadEvent event,
    Emitter<ChatListState> emit,
  ) async {
    debugPrint('Start loading chats with onLoadChats in ChatListBloc');
    final chats = await _getChatsByUser(
      GetChatsByUserParams(
        userId: event.userId,
      ),
    );
    chats.map(
      (chat) => chat.messages!.sort(
        (a, b) => b.createdAt.compareTo(a.createdAt),
      ),
    );
    emit(ChatListLoadedState(chats: chats));
  }
}
