import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/entities/index.dart';

part 'message_model.g.dart';

@HiveType(typeId: 2)
class MessageModel {
  const MessageModel({
    required this.chatId,
    required this.senderId,
    required this.receiverId,
    required this.content,
    required this.createdAt,
  });

  @HiveField(0)
  final String chatId;

  @HiveField(1)
  final String senderId;

  @HiveField(2)
  final String receiverId;

  @HiveField(3)
  final String content;

  @HiveField(4)
  final DateTime createdAt;

  factory MessageModel.fromJson(
    Map<String, dynamic> json,
    String chatId,
  ) {
    return MessageModel(
      chatId: chatId,
      senderId: json['senderId'] as String,
      receiverId: json['receiverId'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  factory MessageModel.fromEntity(Message message) {
    return MessageModel(
      chatId: message.chatId,
      senderId: message.senderId,
      receiverId: message.receiverId,
      content: message.content,
      createdAt: message.createdAt,
    );
  }

  Message toEntity() {
    return Message(
      chatId: chatId,
      senderId: senderId,
      receiverId: receiverId,
      content: content,
      createdAt: createdAt,
    );
  }
}
