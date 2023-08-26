import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/domain/index.dart';
import '../../../../../shared/presentation/index.dart';
import '../../../../auth/presentation/blocs/auth/auth_bloc.dart';
import '../../blocs/add_content/add_content_cubit.dart';
import '../../blocs/manage_content/manage_content_bloc.dart';
import '../../index.dart';

class ManageUploadedVideos extends StatelessWidget {
  const ManageUploadedVideos({super.key, required this.posts});

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    if (posts.isEmpty) {
      return const Center(child: Text('No content uploaded yet'));
    }

    return BlocListener<AddContentCubit, AddContentState>(
      listener: (context, state) {
        if (state.status == AddContentStatus.success) {
          context.read<ManageContentBloc>().add(
                ManageContentGetPostsByUserEvent(
                  userId: context.read<AuthBloc>().state.user.id,
                ),
              );
        }
      },
      child: GridView.builder(
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
          return ManageDeletePost(
            post: post,
            // posts: posts,
            child: VideoPlayerItem(
              assetPath: post.assetPath,
              key: ValueKey(post.id),
            ),
          );
        },
      ),
    );
  }
}
