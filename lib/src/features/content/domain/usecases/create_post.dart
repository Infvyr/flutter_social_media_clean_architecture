import '../../../../shared/domain/index.dart';
import '../../../feed/domain/repository/index.dart';

class CreatePost implements UseCase<void, CreatePostParams> {
  CreatePost(this.repository);

  final PostRepository repository;

  @override
  call(params) {
    return repository.createPost(params.post);
  }
}

class CreatePostParams extends Params {
  CreatePostParams({required this.post});

  final Post post;

  @override
  List<Object?> get props => [post];
}
