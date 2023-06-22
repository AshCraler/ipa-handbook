import 'package:flutter/material.dart';

class InfiniteColorScheme {
  const InfiniteColorScheme._();

  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF24A8D8),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFC0E8FF),
    onPrimaryContainer: Color(0xFF001E2B),
    secondary: Color(0xFF4D616C),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFD0E6F3),
    onSecondaryContainer: Color(0xFF091E27),
    tertiary: Color(0xFF5E5A7D),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFE4DFFF),
    onTertiaryContainer: Color(0xFF1B1736),
    error: Color(0xFFDE3730),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFF0F0F0),
    onBackground: Color(0xFF191C1E),
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF191C1E),
    surfaceVariant: Color(0xFFDCE3E9),
    onSurfaceVariant: Color(0xFF40484C),
    outline: Color(0xFF71787D),
    onInverseSurface: Color(0xFFF0F1F3),
    inverseSurface: Color(0xFF2E3133),
    inversePrimary: Color(0xFF70D2FF),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFFFFFFFF),
    // outlineVariant: Color(0xFFC0C7CD),
    // scrim: Color(0xFF000000),
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF70D2FF),
    onPrimary: Color(0xFF003547),
    primaryContainer: Color(0xFF004D66),
    onPrimaryContainer: Color(0xFFC0E8FF),
    secondary: Color(0xFFB5CAD6),
    onSecondary: Color(0xFF1F333D),
    secondaryContainer: Color(0xFF364954),
    onSecondaryContainer: Color(0xFFD0E6F3),
    tertiary: Color(0xFFC8C2EA),
    onTertiary: Color(0xFF302C4C),
    tertiaryContainer: Color(0xFF464364),
    onTertiaryContainer: Color(0xFFE4DFFF),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF1C2022),
    onBackground: Color(0xFFE1E2E5),
    surface: Color(0xFF191C1E),
    onSurface: Color(0xFFE1E2E5),
    surfaceVariant: Color(0xFF40484C),
    onSurfaceVariant: Color(0xFFC0C7CD),
    outline: Color(0xFF8A9297),
    onInverseSurface: Color(0xFF191C1E),
    inverseSurface: Color(0xFFE1E2E5),
    inversePrimary: Color(0xFF006686),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF191C1E),
    // outlineVariant: Color(0xFF40484C),
    // scrim: Color(0xFF000000),
  );
}

extension InfiniteColorSchemeExtension on ColorScheme {
  Color get disableTextColor => onSurface.withOpacity(0.38);
  Color get disableColor => onSurface.withOpacity(0.12);
  Color get dividerColor => disableColor;
}

extension ColorBuildContextExtension on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  // CustomColors get customColors =>
  //     Theme.of(this).extension<CustomColors>() ??
  //     (Theme.of(this).brightness == Brightness.light ? lightCustomColors : darkCustomColors);

  Color get primaryColor => colorScheme.primary;

  Color get onPrimaryColor => colorScheme.onPrimary;

  Color get errorColor => colorScheme.error;

  Color get onErrorColor => colorScheme.onError;

  Color get shadowColor => colorScheme.shadow;

  Color get surfaceColor => colorScheme.surface;

  Color get onSurfaceColor => colorScheme.onSurface;

  Color get onSurfaceVariant => colorScheme.onSurfaceVariant;

  Color get backgroundColor => colorScheme.background;

  Color get outlineColor => colorScheme.outline;

  Color get onBackground => colorScheme.onBackground;

  Color get darkRed => Color.alphaBlend(red.withOpacity(0.85), onBackground);

  Color get surfaceGray => Color.alphaBlend(surfaceColor.withOpacity(0.5), backgroundColor);

  Color get surfaceGray2 => Color.alphaBlend(surfaceColor.withOpacity(0.1), backgroundColor);

  Color get surface1 => Color.alphaBlend(primaryColor.withOpacity(0.05), surfaceColor);

  Color get surface2 => Color.alphaBlend(primaryColor.withOpacity(0.08), surfaceColor);

  Color get surface3 => Color.alphaBlend(primaryColor.withOpacity(0.11), surfaceColor);

  Color get primarySurface => primaryColor.withOpacity(.2);

  Color get disableTextColor => colorScheme.disableTextColor;

  Color get disableColor => colorScheme.disableColor;

  Color get dividerColor => colorScheme.disableColor;

  ///Red
  Color get red => colorScheme.error;

  Color get onRed => colorScheme.onError;

  Color get redContainer => colorScheme.errorContainer;

  Color get onRedContainer => colorScheme.onErrorContainer;

  ///Green
  // Color get greenColor => customColors.green!;

  // Color get onGreen => customColors.onGreen!;

  // Color get greenContainer => customColors.greenContainer!;

  // Color get onGreenContainer => customColors.onGreenContainer!;

  // ///Orange
  // Color get orangeColor => customColors.orange!;

  // Color get onOrange => customColors.onOrange!;

  // Color get orangeContainer => customColors.orangeContainer!;

  // Color get onOrangeContainer => customColors.onOrangeContainer!;

  // ///Navy Blue
  // Color get blueColor => customColors.blue!;

  // Color get onBlue => customColors.onBlue!;

  // Color get blueContainer => customColors.blueContainer!;

  // Color get onBlueContainer => customColors.onBlueContainer!;
}
