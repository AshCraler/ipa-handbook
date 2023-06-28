part of 'theme_component.dart';

ButtonStyle _getInfiniteButtonStyle(ColorScheme colorScheme) => ButtonStyle(
      elevation: MaterialStateProperty.all<double>(0.0),
      textStyle: MaterialStateProperty.all(infiniTextTheme(colorScheme)
          .titleMedium
          ?.copyWith(
            fontSize: InfiniteSize.size(18),
          )
          .medium),
    );

MaterialStateProperty<EdgeInsetsGeometry?> get buttonPadding =>
    MaterialStateProperty.all(EdgeInsets.symmetric(
      horizontal: InfiniteSize.buttonPadding,
      vertical: InfiniteSize.size(0),
    ));

MaterialStateProperty<RoundedRectangleBorder?> get buttonShape =>
    MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(InfiniteSize.buttonRadius),
    ));

ButtonStyle getTextButtonStyle(ColorScheme colorScheme,
        {Color? foregroundColor,
        EdgeInsetsGeometry padding =
            const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        Size? minimumSize}) =>
    _getInfiniteButtonStyle(colorScheme).copyWith(
      padding: MaterialStateProperty.all(padding),
      minimumSize: MaterialStateProperty.all(minimumSize),
      foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return colorScheme.disableTextColor;
        }
        return foregroundColor ?? colorScheme.primary;
      }),
    );

ButtonStyle getElevatedButtonStyle(
        ColorScheme colorScheme, Color backgroundColor) =>
    _getInfiniteButtonStyle(colorScheme).copyWith(
        padding: buttonPadding,
        shape: buttonShape,
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.disableColor;
          } else if (states.contains(MaterialState.pressed)) {
            return Color.alphaBlend(
                colorScheme.onPrimary.withOpacity(0.12), backgroundColor);
          }
          return backgroundColor;
        }),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.disableTextColor;
          }
          return colorScheme.onPrimary;
        }),
        overlayColor:
            MaterialStateProperty.all(backgroundColor.withOpacity(0.06)));

ButtonStyle getOutlinedButtonStyle(ColorScheme colorScheme, Color color) =>
    _getInfiniteButtonStyle(colorScheme).copyWith(
        padding: buttonPadding,
        shape: buttonShape,
        side: MaterialStateProperty.resolveWith<BorderSide?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) return null;
          return BorderSide(color: color);
        }),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.disableTextColor;
          }
          return color;
        }),
        overlayColor: MaterialStateProperty.all(color.withOpacity(0.06)));

TextButtonThemeData infiniTextButtonTheme(ColorScheme colorScheme) =>
    TextButtonThemeData(
      style: _getInfiniteButtonStyle(colorScheme),
    );

OutlinedButtonThemeData infiniteOutlinedButtonTheme(ColorScheme colorScheme) =>
    OutlinedButtonThemeData(
        style: _getInfiniteButtonStyle(colorScheme).copyWith(
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: buttonPadding,
      shape: buttonShape,
      side: MaterialStateProperty.resolveWith<BorderSide?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) return null;
        return BorderSide(color: colorScheme.outline);
      }),
      minimumSize:
          MaterialStateProperty.all(Size.fromHeight(InfiniteSize.buttonHeight)),
      maximumSize: MaterialStateProperty.all(
          Size.fromHeight(2 * InfiniteSize.buttonHeight)),
    ));

ElevatedButtonThemeData infiniteElevatedButtonTheme(ColorScheme colorScheme) =>
    ElevatedButtonThemeData(
      style: _getInfiniteButtonStyle(colorScheme).copyWith(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.disableColor;
          } else if (states.contains(MaterialState.pressed)) {
            return Color.alphaBlend(
                colorScheme.onPrimary.withOpacity(0.12), colorScheme.primary);
          }
          return colorScheme.primary;
        }),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.disableTextColor;
          }
          return colorScheme.onPrimary;
        }),
        padding: buttonPadding,
        shape: buttonShape,
        maximumSize: MaterialStateProperty.all(
            Size.fromHeight(2 * InfiniteSize.buttonHeight)),
        minimumSize: MaterialStateProperty.all(
            Size.fromHeight(InfiniteSize.buttonHeight)),
      ),
    );

infiniteFABTheme(ColorScheme colorScheme) => FloatingActionButtonThemeData(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
    );

infiniteCardTheme(ColorScheme colorScheme) => CardTheme(
      color: colorScheme.surface,
      margin: EdgeInsets.zero,
      shape: InfiniteShape.cardShape,
      surfaceTintColor: colorScheme.surface,
      elevation: 1,
    );

infiniteSwitchTheme(ColorScheme colorScheme) => SwitchThemeData(
      trackColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) return colorScheme.primary;
        return colorScheme.disableTextColor;
      }),
      thumbColor: MaterialStateProperty.all(colorScheme.surface),
    );

infiniteRadioTheme(ColorScheme colorScheme) => RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) return colorScheme.primary;
        return colorScheme.outline;
      }),
      overlayColor: MaterialStateProperty.all(colorScheme.secondaryContainer),
    );
