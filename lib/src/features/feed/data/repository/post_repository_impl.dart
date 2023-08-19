import '../../../../shared/domain/index.dart';
import '../../domain/repository/index.dart';
import '../data_sources/index.dart';

class PostRepositoryImpl implements PostRepository {
  const PostRepositoryImpl(this.mockFeedDataSource);

  final MockFeedDataSource mockFeedDataSource;

  @override
  Future<List<Post>> getPosts() => mockFeedDataSource.getPosts();

  @override
  Future<List<Post>> getPostsByUser(String userId) => mockFeedDataSource.getPostsByUser(userId);
}
