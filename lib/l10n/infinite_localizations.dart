import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Language {
  String? languageCode;
  String? name;

  Language({
    this.languageCode,
    this.name,
  });
}

///This class store all supported languages and delegates. It also provides a method to get the language by code.

class InfiniteLocalizations {
  static const List<Locale> _sortedSupportedLocales = <Locale>[
    Locale('vi'),
    Locale('en'),
    // Locale('de'),
    // Locale('es'),
    // Locale('zh'),
    // Locale('hi'),
    // Locale('fr'),
    // Locale('pt'),
    // Locale('id'),
    // Locale('ja'),
    // Locale('ru'),
    // Locale('ko'),
    // Locale('it'),
    // Locale('th'),
    // Locale('ms'),
    // Locale('my'),
    // Locale('tl'),
    // Locale('bn'),
    // Locale('sw'),
    // Locale('tr'),
    // Locale('ta'),
    // Locale('uk'),
    // Locale('fi'),
    // Locale('sl'),
    // Locale('pl'),
    // Locale('ro'),
    // Locale('be'),
    // Locale('az'),
    // Locale('el'),
    // Locale('bg'),
    // Locale('hu'),
    // Locale('sr'),
    // Locale('cs'),
    // Locale('kk'),
    // Locale('lt'),
    // Locale('lv'),
    // Locale('hr'),
    // Locale('bs'),
    // Locale('sk'),
    // Locale('et'),
    // Locale('nl'),
    // Locale('sq'),
    // Locale('ca'),
    // Locale('sv'),
  ];

  static final List<Language> _languages = <Language>[
    Language(languageCode: 'vi', name: 'Tiếng Việt'),
    Language(languageCode: 'en', name: 'English'),
    // Language(languageCode: 'de', name: 'Deutsch'),
    // Language(languageCode: 'es', name: 'Español'),
    // Language(languageCode: 'zh', name: '中国人'),
    // Language(languageCode: 'hi', name: 'हिंदी'),
    // Language(languageCode: 'fr', name: 'Français'),
    // Language(languageCode: 'pt', name: 'Português'),
    // Language(languageCode: 'id', name: 'Bahasa Indonesia'),
    // Language(languageCode: 'ja', name: '日本'),
    // Language(languageCode: 'ru', name: 'Русский'),
    // Language(languageCode: 'ko', name: '한국인'),
    // Language(languageCode: 'it', name: 'Italiano'),
    // Language(languageCode: 'th', name: 'ไทย'),
    // Language(languageCode: 'ms', name: 'Malaysia'),
    // Language(languageCode: 'my', name: 'မြန်မာ'),
    // Language(languageCode: 'tl', name: 'Filipino'),
    // Language(languageCode: 'bn', name: 'বাঙালি'),
    // Language(languageCode: 'sw', name: 'Mswahili'),
    // Language(languageCode: 'tr', name: 'Türkçe'),
    // Language(languageCode: 'ta', name: 'தமிழ்'),
    // Language(languageCode: 'uk', name: 'українська'),
    // Language(languageCode: 'fi', name: 'Suomen kieli'),
    // Language(languageCode: 'sl', name: 'Slovenija'),
    // Language(languageCode: 'pl', name: 'Polski'),
    // Language(languageCode: 'ro', name: 'Romania'),
    // Language(languageCode: 'be', name: 'Беларусь'),
    // Language(languageCode: 'az', name: 'Azərbaycan'),
    // Language(languageCode: 'el', name: 'Ελληνικά'),
    // Language(languageCode: 'bg', name: 'България'),
    // Language(languageCode: 'hu', name: 'Magyarország'),
    // Language(languageCode: 'sr', name: 'Србија'),
    // Language(languageCode: 'cs', name: 'čeština'),
    // Language(languageCode: 'kk', name: 'қазақ'),
    // Language(languageCode: 'lt', name: 'lietuvių'),
    // Language(languageCode: 'lv', name: 'latviski'),
    // Language(languageCode: 'hr', name: 'Hrvatski'),
    // Language(languageCode: 'bs', name: 'Bosanski'),
    // Language(languageCode: 'sk', name: 'slovenský'),
    // Language(languageCode: 'et', name: 'eestlane'),
    // Language(languageCode: 'nl', name: 'Nederlands'),
    // Language(languageCode: 'sq', name: 'shqip'),
    // Language(languageCode: 'ca', name: 'català'),
    // Language(languageCode: 'sv', name: 'svenska'),
  ];

  //Getters
  static List<Locale> get supportedLocales => _sortedSupportedLocales;

  static Locale findLocale(String? code) {
    return _sortedSupportedLocales.firstWhere(
        (element) => element.languageCode.toLowerCase() == code?.toLowerCase(), orElse: () {
      return _sortedSupportedLocales.first;
    });
  }

  static String getLanguageName(String code) {
    return _languages.firstWhere((element) => element.languageCode == code).name ?? "";
  }
}

extension LocalizationExtension on BuildContext {
  AppLocalizations get localizations => AppLocalizations.of(this)!;
}
