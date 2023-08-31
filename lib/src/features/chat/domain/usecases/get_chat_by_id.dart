import '../../../../shared/domain/index.dart';
import '../entities/index.dart';
import '../repositories/index.dart';

class GetChatById implements UseCase<Chat, GetChatByIdParams> {
  GetChatById(this.chatRepository);

  final ChatRepository chatRepository;

  @override
  Future<Chat> call(GetChatByIdParams params) {
    return chatRepository.getChatById(params.userId, params.chatId);
  }
}

class GetChatByIdParams extends Params {
  GetChatByIdParams({
    required this.userId,
    required this.chatId,
  });

  final String userId;
  final String chatId;

  @override
  List<Object?> get props => [userId, chatId];
}
