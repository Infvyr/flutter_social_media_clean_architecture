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
    final result = localFeedDatasource.getPosts();
    if ((await result).isEmpty) {
      final posts = await mockFeedDataSource.getPosts();
      for (final post in posts) {
        await localFeedDatasource.addPost(post);
      }
      return posts;
    } else {
      debugPrint('Loaded posts from Hive storage');
      return result;
    }
  }

  @override
  Future<List<Post>> getPostsByUser(String userId) async {
    final result = localFeedDatasource.getPostsByUser(userId);
    if ((await result).isEmpty) {
      final posts = await mockFeedDataSource.getPostsByUser(userId);
      for (final post in posts) {
        await localFeedDatasource.addPost(post);
      }
      return posts;
    } else {
      debugPrint('Loaded posts by user from Hive storage');
      return result;
    }
  }

  @override
  Future<void> createPost(Post post) async => await localFeedDatasource.addPost(post);
}
