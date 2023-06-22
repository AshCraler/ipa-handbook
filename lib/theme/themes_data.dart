import 'package:flutter/material.dart';

import 'colors/color_schemes.dart';
import 'theme_components/theme_component.dart';

class InfiniteTheme {
  const InfiniteTheme._();

  static ThemeData get lightTheme => getTheme(InfiniteColorScheme.lightColorScheme, false);

  static ThemeData get darkTheme => getTheme(InfiniteColorScheme.darkColorScheme, true);

  static ThemeData getTheme(ColorScheme colorScheme, bool isDark) {
    return ThemeData(
      useMaterial3: true,

      ///BRIGHTNESS
      brightness: isDark ? Brightness.dark : Brightness.light,

      ///COLORS
      //scheme
      colorScheme: colorScheme,

      //backgrounds
      canvasColor: colorScheme.surface,
      scaffoldBackgroundColor: colorScheme.background,
      cardColor: colorScheme.surface,
      dialogBackgroundColor: colorScheme.surface,

      //dividers
      dividerColor: colorScheme.outline,
      dividerTheme: DividerThemeData(
        color: colorScheme.outline,
        thickness: 1,
        space: 0,
      ),

      //custom color
      // extensions: [isDark ? darkCustomColors : lightCustomColors],

      ///COMPONENTS
      //text
      textTheme: infiniTextTheme(colorScheme),

      ///buttons
      textButtonTheme: infiniTextButtonTheme(colorScheme),
      outlinedButtonTheme: infiniteOutlinedButtonTheme(colorScheme),
      elevatedButtonTheme: infiniteElevatedButtonTheme(colorScheme),

      // ///app bar
      // appBarTheme: haloAppBarTheme(colorScheme, isDark),

      // ///bottom bar
      // bottomAppBarTheme: haloBottomAppBarTheme(colorScheme, isDark),
      // bottomNavigationBarTheme: haloBottomNavigationBarTheme(colorScheme),

      // /// chip
      // chipTheme: haloChipTheme(colorScheme),

      // ///others
      iconTheme: infiniteIconTheme(colorScheme),
      // radioTheme: haloRadioTheme(colorScheme),
      // checkboxTheme: haloCheckboxTheme(colorScheme),
      // // switchTheme: haloSwitchTheme(colorScheme),
      // ///tab bar
      // tabBarTheme: haloTabBarTheme(colorScheme),

      // ///FAB
      // floatingActionButtonTheme: haloFABTheme(colorScheme),

      // ///input, text field
      // inputDecorationTheme: haloInputDecorationTheme(colorScheme),
      // textSelectionTheme: TextSelectionThemeData(
      //   cursorColor: colorScheme.onSurfaceVariant,
      // ),
      // listTileTheme: ListTileThemeData(
      //   horizontalTitleGap: HaloSize.paddingXS,
      // ),

      // /// card
      // cardTheme: haloCardTheme(colorScheme),
    );
  }
}
