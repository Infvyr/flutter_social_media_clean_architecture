import 'package:equatable/equatable.dart';

class Message extends Equatable {
  const Message({
    required this.chatId,
    required this.senderId,
    required this.receiverId,
    required this.content,
    required this.createdAt,
  });

  final String chatId;
  final String senderId;
  final String receiverId;
  final String content;
  final DateTime createdAt;

  @override
  List<Object?> get props => [chatId, senderId, receiverId, content, createdAt];
}
