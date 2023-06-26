import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:ipa_handbook/config/di/dependency_injection.dart';
import 'package:ipa_handbook/theme/infinite_theme.dart';
import 'package:ipa_handbook/ui/sound/widgets/audio_view.dart';
import 'package:ipa_handbook/ui/sound/widgets/video_view.dart';

import '../../../models/sound_detail/sound_detail.dart';
import '../../../network/network.dart';

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
  late final Future<SoundDetail> _soundDetail;
  final List<AudioPlayer> _audioPlayers = [];

  Future<SoundDetail> _fetchSoundDetail() async {
    final response = await getIt.get<DioClient>().getRequest<String>(
          'api/sounds/${widget.sound}',
        );

    final result = SoundDetail.fromJson(response);
    for (final _ in result.simpleExamples!) {
      _audioPlayers.add(AudioPlayer());
    }

    return result;
  }

  @override
  void initState() {
    super.initState();
    _soundDetail = _fetchSoundDetail();
  }

  @override
  void dispose() {
    for (final player in _audioPlayers) {
      player.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('/${widget.sound}/'),
      ),
      body: Center(
        child: FutureBuilder<SoundDetail>(
          future: _soundDetail,
          builder: (BuildContext context, AsyncSnapshot<SoundDetail> asyncSnapshot) {
            switch (asyncSnapshot.connectionState) {
              //Loading
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              //Loaded
              case ConnectionState.done:
                if (asyncSnapshot.hasError) {
                  return Center(
                    child: Text(asyncSnapshot.error.toString()),
                  );
                }
                final data = asyncSnapshot.data as SoundDetail;

                return _buildBody(context, data);

              //Default
              default:
                return const Text('Something went wrong! Please try again later.');
            }
          },
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, SoundDetail data) {
    return ListView(
      padding: InfinitePadding.all,
      children: [_buildVideoCard(context, data), _buildInWordCard(context)],
    );
  }

  Card _buildVideoCard(BuildContext context, SoundDetail data) {
    return Card(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfiniteSpacing.small,
          Text('/${widget.sound}/', style: context.titleLarge),
          InfiniteDivider.withPadding,
          InfiniteSpacing.small,
          VideoView(videoUrl: data.guideVideo),
          InfiniteSpacing.small,
          Padding(
            padding: InfinitePadding.horizontal,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: 'To make the /${widget.sound}/ sound: \n',
                      style: context.titleMedium?.bold),
                  TextSpan(
                    text: data.guideText,
                    style: context.bodyMedium?.italic,
                  ),
                ],
              ),
            ),
          ),
          InfiniteSpacing.small,
          Padding(
            padding: InfinitePadding.horizontal,
            child: Wrap(
              alignment: WrapAlignment.center,
              runSpacing: InfiniteSize.paddingXXS,
              spacing: InfiniteSize.paddingXXS,
              children: [
                for (final ex in data.simpleExamples!)
                  AudioView(
                    audioPlayer: _audioPlayers[data.simpleExamples!.indexOf(ex)],
                    sourceUrl: '${DioClient.baseUrlTest}data/${ex.audio!}',
                    text: ex.text!,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInWordCard(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(
            'In Words',
            style: context.titleLarge,
          ),
        ],
      ),
    );
  }
}
