import 'package:flutter/material.dart';

import '../../../../../shared/presentation/index.dart';
import '../../blocs/add_content/add_content_cubit.dart';
import '../../index.dart';

class PostContent extends StatelessWidget {
  const PostContent({
    super.key,
    required this.state,
  });

  final AddContentState state;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        VideoPlayerItem(assetPath: state.video!.path),
        Positioned(
          bottom: 20,
          left: 20,
          right: 20,
          child: SafeArea(
            child: FilledButton(
              onPressed: () => showContentModalBottomSheet(context),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue.withOpacity(0.8)),
                foregroundColor: MaterialStateProperty.all(Colors.white.withOpacity(0.8)),
              ),
              child: const Text('Add a caption'),
            ),
          ),
        ),
      ],
    );
  }
}
