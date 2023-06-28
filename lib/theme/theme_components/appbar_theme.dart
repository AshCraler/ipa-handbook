part of 'theme_component.dart';

IconThemeData infiniteIconTheme(ColorScheme colorScheme) =>
    IconThemeData(color: colorScheme.onSurface);

AppBarTheme infinteAppBarTheme(ColorScheme colorScheme, bool isDark) =>
    (isDark ? ThemeData.dark() : ThemeData.light()).appBarTheme.copyWith(
          elevation: 0.5,
          scrolledUnderElevation: 2,
          toolbarHeight: InfiniteSize.appBarHeight,
          shadowColor: colorScheme.shadow,
          centerTitle: true,
          systemOverlayStyle: getSystemOverlay(isDark),
          titleTextStyle: infiniTextTheme(colorScheme).titleLarge,
          color: colorScheme.surface,
          surfaceTintColor: colorScheme.surface,
          iconTheme: infiniteIconTheme(colorScheme),
        );

BottomAppBarTheme bottomAppBarTheme(ColorScheme colorScheme, bool isDark) =>
    (isDark ? ThemeData.dark() : ThemeData.light()).bottomAppBarTheme.copyWith(
          elevation: 0.5,
          color: colorScheme.surface,
        );

BottomNavigationBarThemeData infiniteBottomNavigationBarTheme(
        ColorScheme colorScheme) =>
    BottomNavigationBarThemeData(
      elevation: 0.5,
      backgroundColor: colorScheme.surface,
      selectedItemColor: colorScheme.primary,
      unselectedItemColor: colorScheme.onSurface,
    );

SystemUiOverlayStyle getSystemOverlay(bool isDark) {
  return (isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark)
      .copyWith(
    statusBarColor: Colors.transparent,
  );
}
