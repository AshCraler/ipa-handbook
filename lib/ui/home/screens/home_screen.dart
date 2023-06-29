import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:ipa_handbook/config/constants/assets.dart';
import 'package:ipa_handbook/config/di/dependency_injection.dart';
import 'package:ipa_handbook/theme/infinite_theme.dart';

import '../../../config/router/screen_name.dart';
import '../../../models/sound_preview.dart';
import '../../../network/network.dart';
import '../widgets/sound_preview_element.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List> readJsonFile(String filePath) async {
    var input = await rootBundle.loadString(Temp.soundTestData);
    var list = jsonDecode(input);
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              context.pushNamed(BaseScreen.settings.name);
            },
          ),
        ],
      ),
      body: FutureBuilder(
          future: getIt.get<DioClient>().getRequest<String>('api/sounds'),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Something went wrong'),
              );
            }

            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final List list = jsonDecode(snapshot.data!) as List;
            final List<SoundPreview> sounds =
                list.map((e) => SoundPreview.fromJson(jsonEncode(e))).toList();
            final Map<String, List<SoundPreview>> soundsMap = {};
            for (final SoundPreview sound in sounds) {
              if (soundsMap.containsKey(sound.type)) {
                soundsMap[sound.type]!.add(sound);
              } else {
                soundsMap[sound.type!] = [sound];
              }
            }

            return ListView.builder(
              padding: InfinitePadding.all,
              itemCount: soundsMap.length,
              itemBuilder: (context, index) {
                final String key = soundsMap.keys.elementAt(index);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      key.capitalize(),
                      style: context.headlineMedium?.bold,
                    ),
                    InfiniteSpacing.normal,
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: soundsMap[key]!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.5,
                        crossAxisSpacing: InfiniteSize.spacingXS,
                        mainAxisSpacing: InfiniteSize.spacingXS,
                      ),
                      itemBuilder: (context, index) {
                        return SoundPreviewElement(
                          soundPreview: soundsMap[key]![index],
                        );
                      },
                    ),
                    InfiniteSpacing.normal,
                  ],
                );
              },
            );
          }),
    );
  }
}
