import 'package:hive/hive.dart';

import '../../../../shared/data/index.dart';
import '../../domain/entities/index.dart';
import 'message_model.dart';

part 'chat_model.g.dart';

@HiveType(typeId: 3)
class ChatModel {
  const ChatModel({
    required this.id,
    required this.currentUser,
    required this.otherUser,
    this.messages,
  });

  @HiveField(0)
  final String id;

  @HiveField(1)
  final UserModel currentUser;

  @HiveField(2)
  final UserModel otherUser;

  @HiveField(3)
  final List<MessageModel>? messages;

  factory ChatModel.fromJson(
    Map<String, dynamic> json,
    Map<String, dynamic> currentUser,
    Map<String, dynamic> otherUser,
  ) {
    return ChatModel(
      id: json['id'],
      currentUser: UserModel.fromJson(currentUser),
      otherUser: UserModel.fromJson(otherUser),
      messages: (json['messages'] as List).map((message) {
        return MessageModel.fromJson(message, json['id']);
      }).toList(),
    );
  }

  // convert chat entity into chat model
  factory ChatModel.fromEntity(Chat chatEntity) {
    return ChatModel(
      id: chatEntity.id,
      currentUser: UserModel.fromEntity(chatEntity.currentUser),
      otherUser: UserModel.fromEntity(chatEntity.otherUser),
      messages: chatEntity.messages!.map((message) {
        return MessageModel.fromEntity(message);
      }).toList(),
    );
  }

  // convert chat model into chat entity
  Chat toEntity() {
    return Chat(
      id: id,
      currentUser: currentUser.toEntity(),
      otherUser: otherUser.toEntity(),
      messages: messages?.map((message) => message.toEntity()).toList(),
    );
  }
}
