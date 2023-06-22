import 'package:flutter/material.dart';
import '/providers/local_provider.dart';
import '/l10n/infinite_localizations.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.setting),
      ),
      body: Center(child: Consumer<LocaleProvider>(
        builder: (context, provider, child) {
          final String langCode = provider.languageCode;
          return Switch(
            value: langCode == 'en',
            onChanged: (value) {
              Provider.of<LocaleProvider>(context, listen: false)
                  .setLanguageCode(langCode == 'en' ? 'vi' : 'en');
            },
          );
        },
      )),
    );
  }
}
