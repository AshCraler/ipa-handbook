import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'providers/local_provider.dart';
import 'theme/themes_data.dart';
import 'package:provider/provider.dart';

import 'config/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LocaleProvider>(
      create: (ctx) => LocaleProvider(),
      child: Consumer<LocaleProvider>(
        builder: (context, provider, child) => MaterialApp.router(
          ///Debug banner
          debugShowCheckedModeBanner: false,

          ///Theme
          theme: InfiniteTheme.lightTheme,
          darkTheme: InfiniteTheme.darkTheme,

          ///Localization
          locale: Locale(provider.languageCode),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,

          ///Router
          routerConfig: AppRouter.configuration,
        ),
      ),
    );
  }
}
