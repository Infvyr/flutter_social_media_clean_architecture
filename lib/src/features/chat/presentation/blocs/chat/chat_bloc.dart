import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/chat.dart';
import '../../../domain/entities/message.dart';
import '../../../domain/usecases/index.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final GetChatById _getChatById;
  final UpdateChat _updateChat;

  ChatBloc({
    required GetChatById getChatById,
    required UpdateChat updateChat,
  })  : _getChatById = getChatById,
        _updateChat = updateChat,
        super(const ChatLoadingState()) {
    on<ChatLoadEvent>(_onChatLoadEvent);
    on<ChatUpdateEvent>(_onChatUpdateEvent);
  }

  Future<void> _onChatLoadEvent(
    ChatLoadEvent event,
    Emitter<ChatState> emit,
  ) async {
    debugPrint('Start loading chat _onChatLoadEvent');
    final chat = await _getChatById(
      GetChatByIdParams(
        userId: event.userId,
        chatId: event.chatId,
      ),
    );
    emit(ChatLoadedState(chat: chat));
  }

  Future<void> _onChatUpdateEvent(
    ChatUpdateEvent event,
    Emitter<ChatState> emit,
  ) async {
    debugPrint('Start updating chat _onChatUpdateEvent');
    if (state is ChatLoadedState) {
      final state = this.state as ChatLoadedState;
      final message = Message(
        chatId: state.chat.id,
        senderId: state.chat.currentUser.id,
        receiverId: state.chat.otherUser.id,
        content: event.content,
        createdAt: DateTime.now().toString(),
      );
      final updatedChat = state.chat.copyWith(
        // List.from(state.chat.messages!)..add(message)
        messages: [...state.chat.messages!, message],
      );
      await _updateChat(UpdateChatParams(chat: updatedChat));
      emit(ChatLoadedState(chat: updatedChat));
    }
  }
}
