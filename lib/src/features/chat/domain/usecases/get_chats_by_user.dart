import '../../../../shared/domain/index.dart';
import '../entities/index.dart';
import '../repositories/index.dart';

class UpdateChat implements UseCase<void, UpdateParams> {
  UpdateChat(this.chatRepository);

  final ChatRepository chatRepository;

  @override
  Future<void> call(UpdateParams params) {
    return chatRepository.updateChat(params.chat);
  }
}

class UpdateParams extends Params {
  UpdateParams({required this.chat});

  final Chat chat;

  @override
  List<Object?> get props => [chat];
}
