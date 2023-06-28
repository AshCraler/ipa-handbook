part of 'theme_component.dart';

TabBarTheme haloTabBarTheme(ColorScheme colorScheme) =>
    ThemeData.fallback().tabBarTheme.copyWith(
          unselectedLabelColor: colorScheme.onSurfaceVariant,
          labelColor: colorScheme.primary,
          labelStyle: infiniTextTheme(colorScheme).titleMedium,
          unselectedLabelStyle: infiniTextTheme(colorScheme).titleMedium,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: colorScheme.primary, width: 3),
          ),
        );
