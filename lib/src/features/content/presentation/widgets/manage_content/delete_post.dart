import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/domain/index.dart';
import '../../blocs/manage_content/manage_content_bloc.dart';

class ManageDeletePost extends StatelessWidget {
  const ManageDeletePost({
    super.key,
    required this.post,
    required this.child,
    // required this.posts,
  });

  final Post post;
  final Widget child;
  // final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ManageContentBloc, ManageContentState>(
      listener: (context, state) {
        if (state is ManageContentLoadedState) {
          if (state.posts.contains(post)) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: RichText(
                    text: TextSpan(
                      text: 'Post ',
                      children: [
                        TextSpan(
                          text: post.caption.characters.take(10).toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const TextSpan(text: ' deleted successfully'),
                      ],
                    ),
                  ),
                ),
              );
          }
        }
      },
      child: GestureDetector(
        onDoubleTap: () => context.read<ManageContentBloc>().add(
              ManageContentDeletePostEvent(post: post),
            ),
        child: child,
      ),
    );
  }
}
