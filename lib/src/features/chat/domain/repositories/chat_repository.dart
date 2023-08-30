import '../entities/index.dart';

abstract class ChatRepository {
  Future<List<Chat>> getChatsByUserId(String userId);
  Future<Chat> getChatById(String userId, String chatId);
  Future<void> updateChat(Chat chat);
}
