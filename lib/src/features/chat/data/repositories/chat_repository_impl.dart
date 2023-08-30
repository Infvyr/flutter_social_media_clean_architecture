import 'package:flutter/foundation.dart' show debugPrint;

import '../../domain/entities/chat.dart';
import '../../domain/repositories/index.dart';
import '../data_sources/index.dart';

class ChatRepositoryImpl implements ChatRepository {
  ChatRepositoryImpl(
    this.localChatDataSource,
    this.mockChatDataSource,
  );

  final LocalChatDataSource localChatDataSource;
  final MockChatDataSource mockChatDataSource;

  @override
  Future<Chat> getChatById(String userId, String chatId) async {
    try {
      /// TODO: Check for updates from remote db
      final chat = await localChatDataSource.getChatById(chatId);
      if (chat == null) {
        return await mockChatDataSource.getChatById(userId, chatId);
      } else {
        return chat;
      }
    } catch (e) {
      debugPrint('ChatRepositoryImpl.getChatById: $e');
      rethrow;
    }
  }

  @override
  Future<List<Chat>> getChatsByUser(String userId) async {
    try {
      if ((await localChatDataSource.getChats()).isEmpty) {
        final chats = await mockChatDataSource.getChatsByUserId(userId);
        for (final chat in chats) {
          await localChatDataSource.addChat(chat);
        }
        return chats;
      } else {
        debugPrint('ChatRepositoryImpl.getChatsByUserId from local db');
        return await localChatDataSource.getChats();
      }
    } catch (e) {
      debugPrint('ChatRepositoryImpl.getChatsByUserId: $e');
      rethrow;
    }
  }

  @override
  Future<void> updateChat(Chat chat) async {
    try {
      await localChatDataSource.updateChat(chat);
    } catch (e) {
      debugPrint('ChatRepositoryImpl.updateChat: $e');
      rethrow;
    }
  }
}
