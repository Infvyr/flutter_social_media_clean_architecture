import '../entities/index.dart';

abstract class ChatRepository {
  Future<List<Chat>> getChatsByUser(String userId);
  Future<Chat> getChatById(String userId, String chatId);
  Future<void> updateChat(Chat chat);
}
