import 'package:flutter/material.dart';

class NavigationService {
  NavigationService._();

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static String? get currentRoute =>
      getBuildContext != null ? ModalRoute.of(getBuildContext!)?.settings.name : null;

  static BuildContext? get getBuildContext {
    var context = NavigationService.navigatorKey.currentContext;
    if (context == null) {
      return null;
    }
    return context;
  }
}
