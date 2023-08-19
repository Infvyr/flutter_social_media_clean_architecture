import '../../../../shared/data/index.dart';
import '../../../../shared/domain/index.dart';

abstract class MockFeedDataSource {
  Future<List<Post>> getPosts();
  Future<List<Post>> getPostsByUser(String userId);
}

class MockFeedDataSourceImpl implements MockFeedDataSource {
  @override
  Future<List<Post>> getPosts() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return posts.map((post) {
      Map<String, dynamic> user = users.where((user) => user['id'] == post['userId']).first;
      return PostModel.fromJson(post, user).toEntity();
    }).toList();
  }

  @override
  Future<List<Post>> getPostsByUser(String userId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return posts.where((post) => post['userId'] == userId).map((post) {
      Map<String, dynamic> user = users.where((user) => user['id'] == post['userId']).first;
      return PostModel.fromJson(post, user).toEntity();
    }).toList();
  }
}
