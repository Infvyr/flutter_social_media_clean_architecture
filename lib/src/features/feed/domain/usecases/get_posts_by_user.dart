import '../../../../shared/domain/index.dart';
import '../repository/index.dart';

class GetPostsByUser implements UseCase<List<Post>, GetPostsByUserParams> {
  const GetPostsByUser(this.postRepository);

  final PostRepository postRepository;

  @override
  Future<List<Post>> call(GetPostsByUserParams params) => postRepository.getPostsByUser(params.userId);
}

class GetPostsByUserParams extends Params {
  GetPostsByUserParams({required this.userId});

  final String userId;

  @override
  List<Object?> get props => [userId];
}
