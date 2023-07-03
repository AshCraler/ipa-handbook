import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:ipa_handbook/config/di/dependency_injection.dart';
import 'package:ipa_handbook/l10n/infinite_localizations.dart';
import 'package:ipa_handbook/models/sound_detail/example.dart';
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
  final Map<Example, AudioPlayer> _audioPlayers = {};

  Future<SoundDetail> _fetchSoundDetail() async {
    final response = await getIt.get<DioClient>().getRequest<String>(
          'api/sounds/${widget.sound}',
        );

    final result = SoundDetail.fromJson(response);
    for (final ex in result.simpleExamples!) {
      final _ap = AudioPlayer();
      try {
        final _ = await _ap.setSourceUrl('${DioClient.baseUrlTest}data/${ex.audio!}');
      } catch (error) {
        print('error at: ${widget.sound} => ${ex.text} => ${ex.audio!}');
        continue;
      }
      _audioPlayers.putIfAbsent(ex, () => _ap);
    }

    for (final ex in result.compareExamples!) {
      final _ap = AudioPlayer();
      try {
        final _ = await _ap.setSourceUrl('${DioClient.baseUrlTest}data/${ex.audio!}');
      } catch (error) {
        print('error at: ${widget.sound} => ${ex.text} => ${ex.audio!}');
        continue;
      }
      _audioPlayers.putIfAbsent(ex, () => _ap);
    }

    for (final ex in result.positionExamples!) {
      final _ap = AudioPlayer();
      try {
        final _ = await _ap.setSourceUrl('${DioClient.baseUrlTest}data/${ex.audio!}');
      } catch (error) {
        print('error at: ${widget.sound} => ${ex.text} => ${ex.audio!}');
        continue;
      }
      _audioPlayers.putIfAbsent(ex, () => _ap);
    }

    for (final ex in result.practiceExamples!) {
      final _ap = AudioPlayer();
      try {
        final _ = await _ap.setSourceUrl('${DioClient.baseUrlTest}data/${ex.audio!}');
      } catch (error) {
        print('error at: ${widget.sound} => ${ex.text} => ${ex.audio!}');
        continue;
      }
      _audioPlayers.putIfAbsent(ex, () => _ap);
    }

    for (final ex in result.sentenceExamples!) {
      final _ap = AudioPlayer();
      try {
        final _ = await _ap.setSourceUrl('${DioClient.baseUrlTest}data/${ex.audio!}');
      } catch (error) {
        print('error at: ${widget.sound} => ${ex.text} => ${ex.audio!}');
        continue;
      }
      _audioPlayers.putIfAbsent(ex, () => _ap);
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
    for (var element in _audioPlayers.entries) {
      element.value.dispose();
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
    return RawScrollbar(
      thumbColor: context.colorScheme.tertiary,
      child: SingleChildScrollView(
        padding: InfinitePadding.all,
        child: Column(
          children: [
            _buildVideoCard(context, data),
            InfiniteSpacing.normal,
            _buildInWordCard(context, data),
            InfiniteSpacing.normal,
            _buildInSentencesCard(context, data),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoCard(BuildContext context, SoundDetail data) {
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
                      text: context.localizations.pronounce_instruction(widget.sound),
                      style: context.titleMedium?.bold),
                  TextSpan(
                    // text: context.localizations.localeName == 'en'
                    //     ? data.guideText
                    //     : data.guideTextVi,
                    text: data.guideText,
                    style: context.bodyMedium?.italic,
                  ),
                ],
              ),
            ),
          ),
          InfiniteSpacing.small,
          Padding(
            padding: InfinitePadding.all,
            child: Wrap(
              alignment: WrapAlignment.start,
              runSpacing: InfiniteSize.paddingXS,
              spacing: InfiniteSize.paddingXS,
              children: [
                for (final ex in data.simpleExamples!)
                  _audioPlayers[ex] != null
                      ? AudioView(
                          audioPlayer: _audioPlayers[ex]!,
                          text: ex.text!,
                        )
                      : const SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInWordCard(BuildContext context, SoundDetail data) {
    return Card(
      child: Padding(
        padding: InfinitePadding.all,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.localizations.in_words,
              style: context.titleLarge,
            ),
            InfiniteSpacing.small,
            Text(context.localizations.in_word_subtitle(data.name!)),
            InfiniteSpacing.small,
            Text(context.localizations.pair_title),
            InfiniteSpacing.small,
            Wrap(
              alignment: WrapAlignment.start,
              runSpacing: InfiniteSize.paddingXS,
              spacing: InfiniteSize.paddingXS,
              children: [
                for (final ex in data.compareExamples!)
                  _audioPlayers[ex] != null
                      ? AudioView(
                          audioPlayer: _audioPlayers[ex]!,
                          text: ex.text!,
                        )
                      : const SizedBox.shrink(),
              ],
            ),
            InfiniteSpacing.small,
            Text(context.localizations.in_word_long_record_advice(data.name!)),
            InfiniteSpacing.small,
            Text(context.localizations.in_word_long_repeat_advice),
            InfiniteSpacing.small,
            InfiniteDivider.horizontal,
            InfiniteSpacing.small,
            Text(context.localizations.position_example_subtitle(data.name!)),
            InfiniteSpacing.small,
            Text(context.localizations.in_word_listen_advice(data.name!)),
            InfiniteSpacing.small,
            Wrap(
              alignment: WrapAlignment.start,
              runSpacing: InfiniteSize.paddingXS,
              spacing: InfiniteSize.paddingXS,
              children: [
                for (final ex in data.positionExamples!)
                  _audioPlayers[ex] != null
                      ? AudioView(
                          audioPlayer: _audioPlayers[ex]!,
                          text: ex.text!,
                        )
                      : const SizedBox.shrink(),
              ],
            ),
            InfiniteSpacing.small,
            Text(context.localizations.in_word_short_record_advice(data.name!)),
            InfiniteSpacing.small,
            Text(context.localizations.in_word_short_repeat_advice),
          ],
        ),
      ),
    );
  }

  Widget _buildInSentencesCard(BuildContext context, SoundDetail data) {
    return Card(
      child: Padding(
        padding: InfinitePadding.all,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.localizations.in_sentences,
              style: context.titleLarge,
            ),
            InfiniteSpacing.small,
            Text(context.localizations.in_sentence_subtitle(data.name!)),
            InfiniteSpacing.small,
            Text(context.localizations.pair_title),
            InfiniteSpacing.small,
            Wrap(
              alignment: WrapAlignment.start,
              runSpacing: InfiniteSize.paddingXS,
              spacing: InfiniteSize.paddingXS,
              children: [
                for (final ex in data.sentenceExamples!)
                  _audioPlayers[ex] != null
                      ? AudioView(
                          audioPlayer: _audioPlayers[ex]!,
                          text: ex.text!,
                        )
                      : const SizedBox.shrink(),
              ],
            ),
            InfiniteSpacing.small,
            Text(context.localizations.in_sentence_long_record_advice),
            InfiniteSpacing.small,
            Text(context.localizations.in_sentence_long_repeat_advice),
            InfiniteSpacing.small,
            InfiniteDivider.horizontal,
            InfiniteSpacing.small,
            Text(context.localizations.practice_example_subtitle),
            InfiniteSpacing.small,
            Text(context.localizations.in_sentence_listen_advice(data.name!)),
            InfiniteSpacing.small,
            Wrap(
              alignment: WrapAlignment.start,
              runSpacing: InfiniteSize.paddingXS,
              spacing: InfiniteSize.paddingXS,
              children: [
                for (final ex in data.practiceExamples!)
                  _audioPlayers[ex] != null
                      ? AudioView(
                          audioPlayer: _audioPlayers[ex]!,
                          text: ex.text!,
                        )
                      : const SizedBox.shrink(),
              ],
            ),
            InfiniteSpacing.small,
            Text(context.localizations.in_sentence_short_record_advice(data.name!)),
            InfiniteSpacing.small,
            Text(context.localizations.in_sentence_short_repeat_advice),
          ],
        ),
      ),
    );
  }
}
