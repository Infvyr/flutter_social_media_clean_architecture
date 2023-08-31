import '../../../../shared/domain/index.dart';
import '../entities/index.dart';
import '../repositories/index.dart';

class GetChatsByUser implements UseCase<List<Chat>, GetChatsByUserParams> {
  GetChatsByUser(this.chatRepository);

  final ChatRepository chatRepository;

  @override
  Future<List<Chat>> call(GetChatsByUserParams params) {
    return chatRepository.getChatsByUser(params.userId);
  }
}

class GetChatsByUserParams extends Params {
  GetChatsByUserParams({required this.userId});

  final String userId;

  @override
  List<Object?> get props => [userId];
}
