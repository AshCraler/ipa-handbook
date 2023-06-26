import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:ipa_handbook/config/constants/assets.dart';
import 'package:ipa_handbook/config/di/dependency_injection.dart';

import '../../../config/router/screen_name.dart';
import '../../../models/sound_preview.dart';
import '../../../network/network.dart';
import '../widgets/sound_element_view.dart';

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

            final List list =
                jsonDecode((snapshot.data as Response<String>).data as String)
                    as List;
            final List<SoundPreview> sounds =
                list.map((e) => SoundPreview.fromJson(jsonEncode(e))).toList();
            return GridView.builder(
                itemCount: sounds.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return PreviewElement(
                    soundPreview: sounds[index],
                  );
                });
          }),
    );
  }
}
