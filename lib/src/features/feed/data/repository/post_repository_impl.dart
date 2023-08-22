import 'package:flutter/foundation.dart' show debugPrint;

import '../../../../shared/domain/index.dart';
import '../../domain/repository/index.dart';
import '../data_sources/index.dart';

class PostRepositoryImpl implements PostRepository {
  const PostRepositoryImpl(
    this.mockFeedDataSource,
    this.localFeedDatasource,
  );

  final MockFeedDataSource mockFeedDataSource;
  final LocalFeedDatasource localFeedDatasource;

  @override
  Future<List<Post>> getPosts() async {
    /// TODO: load data from local storage if no internet connection
    final localStorage = localFeedDatasource.getPosts();
    if ((await localStorage).isEmpty) {
      final posts = await mockFeedDataSource.getPosts();
      for (final post in posts) {
        await localFeedDatasource.addPost(post);
      }
      return posts;
    } else {
      debugPrint('Loaded from local Hive storage');
      return localStorage;
    }
  }

  @override
  Future<List<Post>> getPostsByUser(String userId) async => await mockFeedDataSource.getPostsByUser(userId);

  @override
  Future<void> createPost(Post post) async => await localFeedDatasource.addPost(post);
}
