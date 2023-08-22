import '../../../../shared/domain/index.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts();
  Future<List<Post>> getPostsByUser(String userId);
  Future<void> createPost(Post post);
}
