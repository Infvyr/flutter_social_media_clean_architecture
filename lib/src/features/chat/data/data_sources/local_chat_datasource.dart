import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/entities/index.dart';
import '../models/chat_model.dart';

abstract class LocalChatDataSource {
  Future<List<Chat>> getChats();
  Future<Chat?> getChatById(String chatId);
  Future<void> addChat(Chat chat);
  Future<void> updateChat(Chat chat);
}

class LocalChatDataSourceImpl implements LocalChatDataSource {
  final boxName = 'chats';
  final boxType = ChatModel;

  @override
  Future<List<Chat>> getChats() async {
    final box = await openBox() as Box<ChatModel>;
    return box.values.map((chat) => chat.toEntity()).toList();
  }

  @override
  Future<Chat?> getChatById(String chatId) async {
    final box = await openBox();
    ChatModel? chat = await box.get(chatId);
    return chat?.toEntity();
  }

  @override
  Future<void> addChat(Chat chat) async {
    final box = await openBox() as Box<ChatModel>;
    await box.put(chat.id, ChatModel.fromEntity(chat));
  }

  @override
  Future<void> updateChat(Chat chat) async {
    final box = await openBox() as Box<ChatModel>;
    await box.put(chat.id, ChatModel.fromEntity(chat));
  }

  Future<Box> openBox() async {
    return await Hive.openBox<ChatModel>(boxName);
  }
}
