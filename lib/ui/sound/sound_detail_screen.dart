import 'package:flutter/material.dart';
import 'package:ipa_handbook/theme/infinite_theme.dart';
import 'package:ipa_handbook/utils/shared/shared_widgets.dart';
import 'package:ipa_handbook/utils/sizes/sizes.dart';
import 'package:video_player/video_player.dart';

class SoundDetailScreen extends StatefulWidget {
  const SoundDetailScreen({
    super.key,
    required this.sound,
  });
  final String sound;

  @override
  State<SoundDetailScreen> createState() => _SoundDetailScreenState();
}

class _SoundDetailScreenState extends State<SoundDetailScreen> {
  late final VideoPlayerController _controller;
  late final Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(
        'https://ipa-api.vercel.app/data/st/video.mp4');

    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.addListener(_updateVideoState);
  }

  void _updateVideoState() {
    if (!_controller.value.isPlaying) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_updateVideoState);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.sound),
      ),
      body: Center(
        child: ListView(
          children: [
            _buildVideo(),
          ],
        ),
      ),
    );
  }

  Widget _buildVideo() {
    return Padding(
      padding: InfinitePadding.all,
      child: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
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
                        borderRadius:
                            BorderRadius.circular(InfiniteSize.cardRadius),
                      ),
                      child: IconButton(
                        icon: Icon(
                          _controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
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
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
