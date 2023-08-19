import '../../../../shared/domain/index.dart';
import '../repository/index.dart';

class GetPosts implements UseCase<List<Post>, GetPostsByUserParams> {
  const GetPosts(this.postRepository);

  final PostRepository postRepository;

  @override
  Future<List<Post>> call(GetPostsByUserParams params) => postRepository.getPosts();
}
