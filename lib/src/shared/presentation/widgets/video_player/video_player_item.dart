import 'dart:io' show File;

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../index.dart';

class VideoPlayerItem extends StatefulWidget {
  const VideoPlayerItem({
    super.key,
    required this.assetPath,
    this.caption,
    this.username,
    this.postId,
    this.isFullScreen = true,
  });

  final String assetPath;
  final String? caption;
  final String? username;
  final String? postId;
  final bool isFullScreen;

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
      ..setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void runVideo() {
    setState(() {
      _controller.value.isPlaying ? _controller.pause() : _controller.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isFullScreen) {
      return GestureDetector(
        onTap: runVideo,
        child: VisibilityDetector(
          key: Key(widget.postId!),
          onVisibilityChanged: (info) {
            if (mounted) {
              if (_controller.value.isInitialized && info.visibleFraction <= 0.5) {
                _controller.pause();
              } else {
                _controller.play();
              }
            }
          },
          child: VideoPlayerItemChild(
            controller: _controller,
            caption: widget.caption,
            username: widget.username,
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: runVideo,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          clipBehavior: Clip.hardEdge,
          child: VideoPlayerItemChild(
            controller: _controller,
            caption: widget.caption,
            username: widget.username,
            isFullScreen: widget.isFullScreen,
          ),
        ),
      );
    }
  }
}
