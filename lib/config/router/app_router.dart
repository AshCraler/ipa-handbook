import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ipa_handbook/ui/sound/sound_detail.dart';

import '../../config/router/screen_name.dart';
import '../../ui/home/screens/home_screen.dart';
import '../../ui/settings/setting_screen.dart';
import '../../widgets/error_widgets/error_page.dart';

///Class to initialize static router of app
///Using go_router package
///Avoid using bloc for authentication, instead we will use Provider
class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavKey =
      GlobalKey<NavigatorState>(debugLabel: 'AppNavigator');

  ///RouterConfig<RouteMatchList>
  static final RouterConfig<Object> configuration = GoRouter(
    debugLogDiagnostics: false,
    navigatorKey: _rootNavKey,
    errorBuilder: (BuildContext context, GoRouterState state) => const NotFoundErrorPageView(),
    redirect: (BuildContext context, GoRouterState state) {
      inspect(state);
      return state.location;
    },
    routes: [
      GoRoute(
        path: '/',
        name: BaseScreen.home.name,
        builder: (context, state) => const HomeScreen(),
      ),

      GoRoute(
        path: BaseScreen.settings.routePath,
        name: BaseScreen.settings.name,
        builder: (context, state) => const SettingScreen(),
      ),

      GoRoute(
        path: BaseScreen.soundDetail.routePath,
        name: BaseScreen.soundDetail.name,
        builder: (context, state) => SoundDetailScreen(
          sound: state.queryParameters['sound']!,
        ),
      ),

      ///Home route
      // _homeRoutes,
    ],
  );

  ///In case we need shell route
  // static final ShellRoute _homeRoutes = ShellRoute(
  //   builder: (BuildContext context, GoRouterState state, Widget child) {
  //     log('Shell route building $child');
  //     return child;
  //   },
  //   routes: const <RouteBase>[],
  // );
}
