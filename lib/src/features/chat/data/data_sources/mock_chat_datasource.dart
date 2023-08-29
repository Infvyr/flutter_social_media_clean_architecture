import '../models/chat_model.dart';
import '../../domain/entities/index.dart';
import '../../../../shared/data/data_sources/chat_data.dart';

import '../../../../shared/data/index.dart';

abstract class MockChatDataSource {
  Future<List<Chat>> getChatsByUserId(String userId);
  Future<Chat> getChatById(String userId, String chatId);
  Future<void> updateChat(Chat chat);
}

class MockChatDataSourceImpl implements MockChatDataSource {
  @override
  Future<List<Chat>> getChatsByUserId(String userId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return chats.where((chat) => (chat['userIds'] as List).contains(userId)).map((chat) {
      final currentUserId = userId;
      final otherUserId = (chat['userIds'] as List).firstWhere((id) => id != currentUserId);
      final currentUser = users.firstWhere((user) => user['id'] == currentUserId);
      final otherUser = users.firstWhere((user) => user['id'] == otherUserId);

      return ChatModel.fromJson(
        chat,
        currentUser,
        otherUser,
      ).toEntity();
    }).toList();
  }

  @override
  Future<Chat> getChatById(String userId, String chatId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return chats.where((chat) => chat['id'] == chatId).map((chat) {
      final currentUserId = userId;
      final otherUserId = (chat['userIds'] as List).firstWhere((id) => id != currentUserId);
      final currentUser = users.firstWhere((user) => user['id'] == currentUserId);
      final otherUser = users.firstWhere((user) => user['id'] == otherUserId);

      return ChatModel.fromJson(
        chat,
        currentUser,
        otherUser,
      ).toEntity();
    }).first;
  }

  @override
  Future<void> updateChat(Chat chat) async {}
}
