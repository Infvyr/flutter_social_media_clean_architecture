import 'package:flutter/material.dart';

import '../../../domain/index.dart';
import 'video_player_item.dart';

class VideoPlayerList extends StatelessWidget {
  const VideoPlayerList({super.key, required this.posts});

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      // physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        for (final post in posts)
          VideoPlayerItem(
            assetPath: post.assetPath,
            username: post.user.name.value,
            caption: post.caption,
            postId: post.id,
          ),
      ],
    );
  }
}
