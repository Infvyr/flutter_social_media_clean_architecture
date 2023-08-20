import 'package:hive_flutter/hive_flutter.dart';

import '../../../../shared/data/index.dart';
import '../../../../shared/domain/index.dart';

abstract class LocalFeedDatasource {
  Future<List<Post>> getPosts();
  Future<void> addPost(Post post);
  Future<void> deleteAllPost();
}

class LocalFeedDatasourceImpl implements LocalFeedDatasource {
  final boxName = 'posts';
  Type boxType = PostModel;

  @override
  Future<List<Post>> getPosts() async {
    Box<PostModel> box = await _openBox() as Box<PostModel>;
    return box.values.map((post) => post.toEntity()).toList();
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

  Future<Box> _openBox() async => await Hive.openBox<PostModel>(boxName);
}
