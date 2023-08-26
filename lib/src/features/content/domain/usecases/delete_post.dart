import '../../../../shared/domain/index.dart';
import '../../../feed/domain/repository/index.dart';

class DeletePost implements UseCase<void, DeletePostParams> {
  DeletePost(this.repository);

  final PostRepository repository;

  @override
  Future<void> call(DeletePostParams params) => repository.deletePost(params.postId);
}

class DeletePostParams extends Params {
  DeletePostParams({required this.postId});

  final String postId;

  @override
  List<Object?> get props => [postId];
}
