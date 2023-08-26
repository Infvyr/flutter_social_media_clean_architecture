import 'package:hive_flutter/hive_flutter.dart';

import '../../../../shared/data/index.dart';
import '../../../../shared/domain/index.dart';

abstract class LocalFeedDatasource {
  Future<List<Post>> getPosts();
  Future<List<Post>> getPostsByUser(String userId);
  Future<void> addPost(Post post);
  Future<void> deleteAllPost();
  Future<void> deletePost(String postId);
}

class LocalFeedDatasourceImpl implements LocalFeedDatasource {
  final boxName = 'posts';
  Type boxType = PostModel;

  @override
  Future<List<Post>> getPosts() async {
    Box<PostModel> box = await _openBox() as Box<PostModel>;
    return box.values.toList().map((post) => post.toEntity()).toList();
  }

  @override
  Future<List<Post>> getPostsByUser(String userId) async {
    Box<PostModel> box = await _openBox() as Box<PostModel>;
    return box.values.where((post) => post.userModel.id == userId).toList().map((post) => post.toEntity()).toList();
  }

  @override
  Future<void> addPost(Post post) async {
    final box = await _openBox();
    await box.put(post.id, PostModel.fromEntity(post));
  }

  @override
  Future<void> deleteAllPost() async {
    final box = await _openBox();
    await box.clear();
  }

  @override
  Future<void> deletePost(String postId) async {
    final box = await _openBox();
    await box.delete(postId);
  }

  Future<Box> _openBox() async => await Hive.openBox<PostModel>(boxName);
}
