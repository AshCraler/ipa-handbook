import 'package:flutter/material.dart';
import 'package:ipa_handbook/theme/infinite_theme.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioView extends StatefulWidget {
  const AudioView({
    super.key,
    required this.audioPlayer,
    required this.sourceUrl,
    required this.text,
  });
  final AudioPlayer audioPlayer;
  final String sourceUrl;
  final String text;

  @override
  State<AudioView> createState() => _AudioViewState();
}

class _AudioViewState extends State<AudioView> {
  bool _isPlaying = false;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();
    widget.audioPlayer.onPositionChanged.listen((Duration p) {
      setState(() {
        _position = p;
      });
    });

    widget.audioPlayer.onPlayerComplete.listen((_) {
      setState(() {
        _isPlaying = false;
        _position = Duration.zero;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Source source = UrlSource(widget.sourceUrl);

    return Container(
      padding: EdgeInsets.all(InfiniteSize.paddingXXS),
      decoration: BoxDecoration(
        color: context.colorScheme.tertiary,
        borderRadius: BorderRadius.circular(InfiniteSize.chipRadius),
      ),
      child: Row(
        children: [
          IconButton(
            icon: _isPlaying ? const Icon(Icons.pause) : const Icon(Icons.play_arrow),
            onPressed: () {
              setState(() {
                if (!_isPlaying) {
                  _isPlaying = true;
                  try {
                    widget.audioPlayer.play(source, position: _position);
                  } catch (e) {
                    print(e);
                  }
                } else {
                  _isPlaying = false;
                  widget.audioPlayer.pause();
                }
              });
            },
          ),
          Text(
            widget.text,
            style: context.bodyMedium?.bold,
          ),
        ],
      ),
    );
  }
}
