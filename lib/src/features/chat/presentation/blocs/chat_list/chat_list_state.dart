part of 'chat_list_bloc.dart';

sealed class ChatListState extends Equatable {
  const ChatListState();

  @override
  List<Object> get props => [];
}

final class ChatListLoadingState extends ChatListState {
  const ChatListLoadingState();
}

final class ChatListLoadedState extends ChatListState {
  const ChatListLoadedState({this.chats = const []});

  final List<Chat> chats;

  @override
  List<Object> get props => [chats];
}
