import 'package:flutter/material.dart';

import '../../../../../shared/domain/index.dart';
import '../../../../../shared/presentation/index.dart';

class ManageUploadedVideos extends StatelessWidget {
  const ManageUploadedVideos({super.key, required this.posts});

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      key: const PageStorageKey('manage_content_grid_view'),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 9 / 16,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return VideoPlayerItem(
          assetPath: post.assetPath,
          key: ValueKey(post.id),
        );
      },
    );
  }
}
