import '../../../../shared/domain/index.dart';
import '../entities/index.dart';
import '../repositories/index.dart';

class UpdateChat implements UseCase<void, UpdateChatParams> {
  UpdateChat(this.chatRepository);

  final ChatRepository chatRepository;

  @override
  Future<void> call(UpdateChatParams params) {
    return chatRepository.updateChat(params.chat);
  }
}

class UpdateChatParams extends Params {
  UpdateChatParams({required this.chat});

  final Chat chat;

  @override
  List<Object?> get props => [chat];
}
