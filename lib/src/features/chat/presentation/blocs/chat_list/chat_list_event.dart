part of 'chat_list_bloc.dart';

sealed class ChatListEvent extends Equatable {
  const ChatListEvent();

  @override
  List<Object> get props => [];
}

class ChatListLoadEvent extends ChatListEvent {
  final String userId;

  const ChatListLoadEvent({required this.userId});

  @override
  List<Object> get props => [userId];
}
