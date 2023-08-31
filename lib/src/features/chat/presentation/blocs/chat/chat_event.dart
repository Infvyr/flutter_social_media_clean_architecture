part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

final class ChatLoadEvent extends ChatEvent {
  const ChatLoadEvent({
    required this.userId,
    required this.chatId,
  });

  final String userId;
  final String chatId;

  @override
  List<Object> get props => [userId, chatId];
}

/// Whenever a user sends/receive a message, this event is triggered.
final class ChatUpdateEvent extends ChatEvent {
  const ChatUpdateEvent({required this.content});

  final String content;

  @override
  List<Object> get props => [content];
}
