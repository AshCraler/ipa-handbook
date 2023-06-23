import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ipa_handbook/config/router/screen_name.dart';
import 'package:ipa_handbook/theme/infinite_theme.dart';
import 'package:ipa_handbook/utils/shared/shared_widgets.dart';
import 'package:ipa_handbook/utils/sizes/sizes.dart';

import '../models/sound_preview.dart';

class PreviewElement extends StatelessWidget {
  const PreviewElement({
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
        margin: InfinitePadding.all,
        padding: InfinitePadding.all,
        decoration: BoxDecoration(
          border: Border.all(color: context.outlineColor),
          borderRadius: BorderRadius.circular(InfiniteSize.cardRadius),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('/${soundPreview.name!}/'),
            Text(soundPreview.example!),
          ],
        ),
      ),
    );
  }
}
