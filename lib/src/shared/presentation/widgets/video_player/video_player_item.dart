import 'dart:io' show File;

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../index.dart';

class VideoPlayerItem extends StatefulWidget {
  const VideoPlayerItem({
    super.key,
    required this.assetPath,
    this.caption,
    this.username,
  });

  final String assetPath;
  final String? caption;
  final String? username;

  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.assetPath.startsWith('assets')
        ? VideoPlayerController.asset(widget.assetPath)
        : VideoPlayerController.file(File(widget.assetPath))
      ..initialize().then(
        (_) {
          // Ensure the first frame is shown after the video is initialized,
          // even before the play button has been pressed.
          setState(() {});
        },
      )
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? GestureDetector(
            onTap: () {
              setState(() {
                _controller.value.isPlaying ? _controller.pause() : _controller.play();
              });
            },
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                children: [
                  VideoPlayer(_controller),
                  const CustomGradientOverlay(),
                  if (widget.caption != null || widget.username != null)
                    VidedoPlayerCaption(username: widget.username!, caption: widget.caption!)
                ],
              ),
            ),
          )
        : const SizedBox();
  }
}
