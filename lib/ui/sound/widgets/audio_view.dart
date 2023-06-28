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

class _AudioViewState extends State<AudioView> with SingleTickerProviderStateMixin {
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
    return GestureDetector(
      onTap: _playAudio,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: InfiniteSize.paddingXS, vertical: InfiniteSize.paddingXXS),
        decoration: BoxDecoration(
          color: context.colorScheme.tertiary.withOpacity(0.5),
          borderRadius: BorderRadius.circular(InfiniteSize.chipRadius),
        ),
        child: RichText(
          maxLines: 4,
          textWidthBasis: TextWidthBasis.longestLine,
          text: TextSpan(
            children: [
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: _isPlaying
                    ? Icon(
                        Icons.pause,
                        size: InfiniteSize.iconHeight,
                      )
                    : Icon(
                        Icons.play_arrow,
                        size: InfiniteSize.iconHeight,
                      ),
              ),
              TextSpan(
                text: widget.text,
                style: context.bodyLarge?.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _playAudio() {
    setState(() {
      if (!_isPlaying) {
        _isPlaying = true;
        try {
          widget.audioPlayer.play(widget.audioPlayer.source!, position: _position);
        } catch (e) {
          print(e);
        }
      } else {
        _isPlaying = false;
        widget.audioPlayer.pause();
      }
    });
  }
}
