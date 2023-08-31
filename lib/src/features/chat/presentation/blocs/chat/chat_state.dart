part of 'chat_bloc.dart';

sealed class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

final class ChatLoadingState extends ChatState {
  const ChatLoadingState();
}

final class ChatLoadedState extends ChatState {
  const ChatLoadedState({required this.chat});

  final Chat chat;

  @override
  List<Object> get props => [chat];
}
