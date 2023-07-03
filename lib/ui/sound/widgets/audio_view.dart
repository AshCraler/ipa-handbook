import 'package:flutter/material.dart';
import 'package:ipa_handbook/theme/infinite_theme.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioView extends StatefulWidget {
  const AudioView({
    super.key,
    required this.audioPlayer,
    required this.text,
  });
  final AudioPlayer audioPlayer;
  final String text;

  @override
  State<AudioView> createState() => _AudioViewState();
}

class _AudioViewState extends State<AudioView> with SingleTickerProviderStateMixin {
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();

    widget.audioPlayer.setReleaseMode(ReleaseMode.stop);

    widget.audioPlayer.onPlayerStateChanged.listen((PlayerState event) {
      switch (event) {
        case PlayerState.playing:
          setState(() {
            _isPlaying = true;
          });
          break;
        case PlayerState.completed:
        case PlayerState.paused:
          setState(() {
            _isPlaying = false;
          });
          break;
        default:
          break;
      }
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
          widget.audioPlayer.resume();
        } catch (e) {
          print('error when playing audio: fwoiefjoei');
        }
      } else {
        _isPlaying = false;
        widget.audioPlayer.pause();
      }
    });
  }
}
