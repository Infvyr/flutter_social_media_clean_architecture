import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/presentation/index.dart';
import '../../blocs/manage_content/manage_content_bloc.dart';
import '../../index.dart';

class ManageUploadedVideos extends StatelessWidget {
  const ManageUploadedVideos({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageContentBloc, ManageContentState>(
      builder: (context, state) {
        if (state is ManageContentLoadingState) {
          /// TODO: Shimmer
          return const Center(child: CircularProgressIndicator());
        } else if (state is ManageContentLoadedState) {
          if (state.posts.isEmpty) {
            return const Center(child: Text('No content uploaded yet'));
          }
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
            itemCount: state.posts.length,
            itemBuilder: (context, index) {
              final post = state.posts[index];
              return ManageDeletePost(
                post: post,
                child: VideoPlayerItem(
                  key: ValueKey(post.id),
                  postId: post.id,
                  assetPath: post.assetPath,
                  isFullScreen: false,
                ),
              );
            },
          );
        } else {
          return const AlertError();
        }
      },
    );
  }
}
