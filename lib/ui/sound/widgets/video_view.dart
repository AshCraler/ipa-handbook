import 'package:flutter/material.dart';
import 'package:ipa_handbook/network/network.dart';
import 'package:ipa_handbook/theme/infinite_theme.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {
  const VideoView({super.key, required this.videoUrl});
  final String? videoUrl;

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late final VideoPlayerController _controller;
  late final Future<void> _initializeVideoPlayerFuture;

  void _updateVideoState() {
    if (!_controller.value.isPlaying) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.videoUrl == null) {
      return;
    }
    _controller = VideoPlayerController.network('${DioClient.baseUrlTest}data/${widget.videoUrl!}');

    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.addListener(_updateVideoState);
  }

  @override
  void dispose() {
    _controller.removeListener(_updateVideoState);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            return _buildBody(context);
          default:
            return const Text('Something went wrong! Please try again later.');
        }
      },
    );
  }

  Widget _buildBody(BuildContext context) {
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: Stack(
        children: [
          VideoPlayer(_controller),
          Center(
            child: Container(
              padding: EdgeInsets.all(InfiniteSize.paddingS),
              decoration: BoxDecoration(
                color: context.colorScheme.tertiary.withOpacity(0.8),
                borderRadius: BorderRadius.circular(InfiniteSize.cardRadius),
              ),
              child: IconButton(
                icon: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  color: context.colorScheme.onTertiary,
                ),
                onPressed: () {
                  setState(() {
                    if (_controller.value.isPlaying) {
                      _controller.pause();
                    } else {
                      _controller.play();
                    }
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
