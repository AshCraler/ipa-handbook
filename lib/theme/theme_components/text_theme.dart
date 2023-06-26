part of 'theme_component.dart';

TextTheme infiniTextTheme(ColorScheme colorScheme) => TextTheme(
      displayLarge: const TextStyle().regular.copyWith(
            fontSize: InfiniteFontSize.displayLarge,
            color: colorScheme.onSurface,
          ),
      displayMedium: const TextStyle().regular.copyWith(
            fontSize: InfiniteFontSize.displayMedium,
            color: colorScheme.onSurface,
          ),
      displaySmall: const TextStyle().regular.copyWith(
            fontSize: InfiniteFontSize.displaySmall,
            color: colorScheme.onSurface,
          ),
      headlineLarge: const TextStyle().regular.copyWith(
            fontSize: InfiniteFontSize.headlineLarge,
            color: colorScheme.onSurface,
          ),
      headlineMedium: const TextStyle().regular.copyWith(
            fontSize: InfiniteFontSize.headlineMedium,
            color: colorScheme.onSurface,
          ),
      headlineSmall: const TextStyle().regular.copyWith(
            fontSize: InfiniteFontSize.headlineSmall,
            color: colorScheme.onSurface,
          ),
      titleLarge: const TextStyle().regular.copyWith(
            fontSize: InfiniteFontSize.titleLarge,
            color: colorScheme.onSurface,
          ),
      titleMedium: const TextStyle().medium.copyWith(
            fontSize: InfiniteFontSize.titleMedium,
            color: colorScheme.onSurface,
          ),
      titleSmall: const TextStyle().medium.copyWith(
            fontSize: InfiniteFontSize.titleSmall,
            color: colorScheme.onSurface,
          ),
      bodyLarge: const TextStyle().regular.copyWith(
            fontSize: InfiniteFontSize.bodyLarge,
            color: colorScheme.onSurface,
          ),
      bodyMedium: const TextStyle().regular.copyWith(
            fontSize: InfiniteFontSize.bodyMedium,
            color: colorScheme.onSurface,
          ),
      bodySmall: const TextStyle().regular.copyWith(
            fontSize: InfiniteFontSize.bodySmall,
            color: colorScheme.onSurface,
          ),
      labelLarge: const TextStyle().medium.copyWith(
            fontSize: InfiniteFontSize.labelLarge,
            color: colorScheme.onSurface,
          ),
      labelMedium: const TextStyle().medium.copyWith(
            fontSize: InfiniteFontSize.labelMedium,
            color: colorScheme.onSurface,
          ),
      labelSmall: const TextStyle().medium.copyWith(
            fontSize: InfiniteFontSize.labelSmall,
            color: colorScheme.onSurface,
          ),
    );

extension FontStyleExtension on TextStyle {
  BuildContext? get context => NavigationService.getBuildContext;

  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  TextStyle get regular => copyWith(fontWeight: FontWeight.normal);

  TextStyle get light => copyWith(fontWeight: FontWeight.w300);

  TextStyle setColor(Color color) => copyWith(
        color: color,
      );

  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  TextStyle get lineThrough => copyWith(decoration: TextDecoration.lineThrough);

  TextStyle get overline => copyWith(decoration: TextDecoration.overline);

  TextStyle get underline => copyWith(decoration: TextDecoration.underline);

  /// set color for Text
  TextStyle get notice =>
      copyWith(color: context?.colorScheme.error ?? InfiniteColorScheme.lightColorScheme.error);

  TextStyle get onNotice =>
      copyWith(color: context?.colorScheme.onError ?? InfiniteColorScheme.lightColorScheme.onError);

  TextStyle get primary =>
      copyWith(color: context?.colorScheme.primary ?? InfiniteColorScheme.lightColorScheme.primary);

  TextStyle get onPrimary => copyWith(
      color: context?.colorScheme.onPrimary ?? InfiniteColorScheme.lightColorScheme.onPrimary);

  TextStyle get secondary => copyWith(
      color: context?.colorScheme.secondary ?? InfiniteColorScheme.lightColorScheme.secondary);

  TextStyle get tertiary => copyWith(
      color: context?.colorScheme.tertiary ?? InfiniteColorScheme.lightColorScheme.tertiary);

  ///black text
  TextStyle get normal => copyWith(
      color: context?.colorScheme.onSurface ?? InfiniteColorScheme.lightColorScheme.onSurface);

  ///gray text
  TextStyle get darkGray => copyWith(
      color: context?.colorScheme.onSurfaceVariant ??
          InfiniteColorScheme.lightColorScheme.onSurfaceVariant);

  TextStyle get disable => copyWith(
      color: context?.disableTextColor ?? InfiniteColorScheme.lightColorScheme.disableTextColor);

  TextStyle get red =>
      copyWith(color: context?.colorScheme.error ?? InfiniteColorScheme.lightColorScheme.error);
  TextStyle get onRed =>
      copyWith(color: context?.colorScheme.onError ?? InfiniteColorScheme.lightColorScheme.onError);
  TextStyle get onRedContainer => copyWith(
      color: context?.colorScheme.onErrorContainer ??
          InfiniteColorScheme.lightColorScheme.onErrorContainer);

  // TextStyle get green => copyWith(color: context?.customColors.green);
  // TextStyle get onGreen => copyWith(color: context?.customColors.onGreen);
  // TextStyle get onGreenContainer => copyWith(color: context?.customColors.onGreenContainer);

  // TextStyle get orange => copyWith(color: context?.customColors.orange);
  // TextStyle get onOrange => copyWith(color: context?.customColors.onOrange);
  // TextStyle get onOrangeContainer => copyWith(color: context?.customColors.onOrangeContainer);

  // TextStyle get blue => copyWith(color: context?.customColors.blue);
  // TextStyle get onBlue => copyWith(color: context?.customColors.onBlue);
  // TextStyle get onBlueContainer => copyWith(color: context?.customColors.onBlueContainer);
  // TextStyle get inversePrimary => copyWith(color: context?.colorScheme.inversePrimary);
}

extension TextBuildContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get _colorScheme => Theme.of(this).colorScheme;

  TextStyle? get displayLarge => textTheme.displayLarge;

  TextStyle? get displayMedium => textTheme.displayMedium;

  TextStyle? get displaySmall => textTheme.displaySmall;

  TextStyle? get headlineLarge => textTheme.headlineLarge;

  TextStyle? get headlineMedium => textTheme.headlineMedium;

  TextStyle? get headlineSmall => textTheme.headlineSmall;

  TextStyle? get titleLarge => textTheme.titleLarge;

  TextStyle? get titleMedium => textTheme.titleMedium;

  ///Fontsize 14
  TextStyle? get titleSmall => textTheme.titleSmall;

  ///Fontsize 16
  TextStyle? get bodyLarge => textTheme.bodyLarge;

  ///Fonsize 15
  TextStyle? get bodyMedium => textTheme.bodyMedium;

  ///Fontsize 13
  TextStyle? get bodySmall => textTheme.bodySmall;

  TextStyle? get labelLarge => textTheme.labelLarge;

  TextStyle? get labelMedium => textTheme.labelMedium;

  TextStyle? get labelSmall => textTheme.labelSmall;

  TextStyle? get buttonText => textTheme.labelLarge;

  TextStyle? get chip => textTheme.labelLarge;

  TextStyle? get fab => textTheme.labelLarge;

  TextStyle? get cardHeader => textTheme.titleMedium;

  TextStyle? get cardSubhead => textTheme.bodyMedium;

  TextStyle? get cardTitle => textTheme.bodyLarge?.copyWith(color: _colorScheme.onSurface);

  TextStyle? get cardSubTitle => textTheme.bodyMedium;

  TextStyle? get cardContent => textTheme.bodyMedium;

  TextStyle? get listTile => cardTitle;

  TextStyle? get listSubTitle => cardSubTitle;

  TextStyle? get inputField => textTheme.bodyLarge;

  TextStyle? get inputFieldLabel => textTheme.bodySmall?.copyWith(color: _colorScheme.onSurface);

  TextStyle? get appBarTitle => textTheme.titleLarge;

  TextStyle? get appBarSubtitle => textTheme.bodyLarge;

  TextStyle? get navigationBar => textTheme.labelMedium;

  TextStyle? get drawerMenu => textTheme.labelLarge?.bold;

  TextStyle? get menuItem => textTheme.bodyLarge;

  TextStyle? get dialogTitle => textTheme.titleLarge;

  TextStyle? get dialogSubTitle => textTheme.titleMedium;

  TextStyle? get dialogMessage => textTheme.bodyMedium;

  TextStyle? get dialogItem => textTheme.bodyLarge;

  TextStyle? get dialogAction => textTheme.labelLarge;

  TextStyle? get primaryText => textTheme.bodyMedium?.setColor(_colorScheme.primary);
}
