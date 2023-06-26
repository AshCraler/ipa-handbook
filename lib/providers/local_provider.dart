import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../l10n/infinite_localizations.dart';

class LocaleProvider extends ChangeNotifier {
  String _languageCode =
      InfiniteLocalizations.supportedLocales.first.languageCode;

  String get languageCode => _languageCode;

  LocaleProvider() {
    initLanguageCode();
  }

  Future<void> initLanguageCode() async {
    _languageCode = await getLanguageCodePrefs();
    notifyListeners();
  }

  void setLanguageCode(String code) {
    _languageCode = code;
    saveLanguageCodePrefs(code);
    notifyListeners();
  }

  /// Cache to SharedPreferences
  static String languageCodeKey = "language_code_key";

  Future<String> getLanguageCodePrefs() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(languageCodeKey) ??
        InfiniteLocalizations.supportedLocales.first.languageCode;
  }

  Future saveLanguageCodePrefs(String code) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(languageCodeKey, code);
  }
}
