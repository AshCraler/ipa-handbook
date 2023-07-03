import 'package:flutter/material.dart';
import 'package:ipa_handbook/theme/infinite_theme.dart';
import '/providers/local_provider.dart';
import '/l10n/infinite_localizations.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.surface1,
      appBar: AppBar(
        title: Text(context.localizations.setting),
      ),
      body: ListView(
        padding: InfinitePadding.all,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(context.localizations.setting_choose_language),
              Consumer<LocaleProvider>(
                builder: (context, provider, child) {
                  return DropdownButton<Locale>(
                    value: InfiniteLocalizations.findLocale(provider.languageCode),
                    items: InfiniteLocalizations.supportedLocales
                        .map((locale) => DropdownMenuItem<Locale>(
                              value: locale,
                              child:
                                  Text(InfiniteLocalizations.getLanguageName(locale.languageCode)),
                            ))
                        .toList(),
                    onChanged: (Locale? value) {
                      provider.setLanguageCode(value!.languageCode);
                    },
                  );
                  // return Switch(
                  //   value: langCode == 'en',
                  //   onChanged: (value) {
                  //     Provider.of<LocaleProvider>(context, listen: false)
                  //         .setLanguageCode(langCode == 'en' ? 'vi' : 'en');
                  //   },
                  // );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
