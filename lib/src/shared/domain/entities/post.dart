// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:flutter_social_media_with_clean_architecture/src/shared/domain/index.dart';

class Post extends Equatable {
  const Post({
    required this.id,
    required this.user,
    required this.caption,
    required this.assetPath,
  });

  final String id;
  final User user;
  final String caption;
  final String assetPath;

  @override
  List<Object?> get props => [id, user, caption, assetPath];
}
