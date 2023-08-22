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
    /// TODO: load from local storage if no internet connection
    final localStorage = await localFeedDatasource.getPosts();
    if (localStorage.isEmpty) {
      final mockStorage = await mockFeedDataSource.getPosts();
      for (final post in mockStorage) {
        await localFeedDatasource.addPost(post);
      }
      return mockStorage;
    } else {
      debugPrint('Loaded from local Hive storage');
      return localStorage;
    }
  }

  @override
  Future<List<Post>> getPostsByUser(String userId) => mockFeedDataSource.getPostsByUser(userId);

  @override
  Future<void> createPost(Post post) => localFeedDatasource.addPost(post);
}
