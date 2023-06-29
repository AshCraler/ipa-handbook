import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ipa_handbook/config/router/screen_name.dart';
import 'package:ipa_handbook/theme/infinite_theme.dart';

import '../../../models/sound_preview.dart';

class SoundPreviewElement extends StatelessWidget {
  const SoundPreviewElement({
    super.key,
    required this.soundPreview,
  });
  final SoundPreview soundPreview;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        BaseScreen.soundDetail.name,
        queryParameters: {"sound": soundPreview.name},
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: InfiniteSize.paddingXS, vertical: InfiniteSize.paddingL),
        decoration: BoxDecoration(
          border: Border.all(color: context.outlineColor),
          borderRadius: BorderRadius.circular(InfiniteSize.buttonRadius),
          boxShadow: InfiniteShadow.boxShadow,
          color: context.surfaceColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '/${soundPreview.name!}/',
              style: context.titleLarge?.bold,
            ),
            Expanded(
              child: Center(
                child: Text(soundPreview.example!),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
