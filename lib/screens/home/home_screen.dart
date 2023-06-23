import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/router/screen_name.dart';
import 'models/sound_preview.dart';
import 'widgets/sound_element_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final List<SoundPreview> sounds;

  @override
  void initState() {
    super.initState();
    sounds = [
      SoundPreview.fromJson('''{
        "crawl_key": "b",
        "name": "b",
        "example": "buy | verb | about",
        "type": "consonant"
    }'''),
      SoundPreview.fromJson('''{
        "crawl_key": "b",
        "name": "b",
        "example": "buy | verb | about",
        "type": "consonant"
    }'''),
      SoundPreview.fromJson('''{
        "crawl_key": "b",
        "name": "b",
        "example": "buy | verb | about",
        "type": "consonant"
    }'''),
      SoundPreview.fromJson('''{
        "crawl_key": "b",
        "name": "b",
        "example": "buy | verb | about",
        "type": "consonant"
    }'''),
    ];
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
      body: GridView.builder(
          itemCount: sounds.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return PreviewElement(
              soundPreview: sounds[index],
            );
          }),
    );
  }
}
