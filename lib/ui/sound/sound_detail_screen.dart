import 'package:flutter/material.dart';
import 'package:ipa_handbook/config/di/dependency_injection.dart';
import 'package:ipa_handbook/theme/infinite_theme.dart';
import 'package:ipa_handbook/ui/sound/widgets/video_view.dart';

import '../../models/sound_detail/sound_detail.dart';
import '../../network/network.dart';

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

  Future<SoundDetail> _fetchSoundDetail() async {
    final response = await getIt.get<DioClient>().getRequest<String>(
          'api/sounds/${widget.sound}',
        );
    return SoundDetail.fromJson(response);
  }

  @override
  void initState() {
    super.initState();
    _soundDetail = _fetchSoundDetail();
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
      children: [
        VideoView(videoUrl: data.guideVideo),
      ],
    );
  }
}
