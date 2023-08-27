import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../index.dart';

class VideoPlayerItemChild extends StatelessWidget {
  const VideoPlayerItemChild({
    super.key,
    required this.controller,
    this.caption,
    this.username,
    this.isFullScreen = true,
  });

  final VideoPlayerController controller;
  final String? caption;
  final String? username;
  final bool isFullScreen;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          VideoPlayer(controller),
          CustomGradientOverlay(decorationBorderRadius: isFullScreen ? 0 : 10),
          if (caption != null || username != null)
            VidedoPlayerCaption(
              username: username!,
              caption: caption!,
            ),
          if (!isFullScreen && !controller.value.isPlaying)
            const Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(bottom: 3.0),
                child: Icon(
                  Icons.play_arrow_rounded,
                  size: 50,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(0, 0),
                      blurRadius: 5,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
