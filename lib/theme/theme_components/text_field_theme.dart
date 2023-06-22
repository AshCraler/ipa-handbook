part of 'theme_component.dart';

InputDecorationTheme haloInputDecorationTheme(ColorScheme colorScheme) => InputDecorationTheme(
      contentPadding: EdgeInsets.all(InfiniteSize.textFieldPadding),
      hintStyle: const TextStyle().regular.copyWith(
            fontSize: InfiniteFontSize.titleMedium,
            color: colorScheme.onSurface.withOpacity(0.6),
          ),
      labelStyle: const TextStyle().regular.copyWith(
            fontSize: InfiniteFontSize.titleMedium,
            color: colorScheme.onSurface.withOpacity(0.6),
          ),
      border: getTextFieldBorder(colorScheme.outline),
      enabledBorder: getTextFieldBorder(colorScheme.outline),
      disabledBorder: getTextFieldBorder(colorScheme.onSurfaceVariant.withOpacity(0.12)),
      focusedBorder: getTextFieldBorder(colorScheme.primary, focused: true),
      errorBorder: getTextFieldBorder(colorScheme.error),
      focusedErrorBorder: getTextFieldBorder(colorScheme.error, focused: true),
      errorStyle: const TextStyle().regular.copyWith(
            fontSize: InfiniteFontSize.bodySmall,
            color: colorScheme.error,
          ),
    );

InputDecoration get textFieldNoBorder => InputDecoration(
      contentPadding: EdgeInsets.all(InfiniteSize.textFieldPadding),
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none,
    );

InputBorder? getTextFieldBorder(Color borderColor, {bool focused = false}) => OutlineInputBorder(
      borderSide:
          BorderSide(color: borderColor, width: (focused ? 2 : 1) * InfiniteSize.outlineWidth),
      borderRadius: BorderRadius.circular(InfiniteSize.textFieldRadius),
    );

InputDecoration textFieldCircleBorder(ColorScheme colorScheme) => InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: InfiniteSize.textFieldPadding, vertical: 13),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: colorScheme.outline, width: InfiniteSize.outlineWidth),
        borderRadius: BorderRadius.circular(InfiniteSize.buttonRadius),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorScheme.outline, width: InfiniteSize.outlineWidth),
        borderRadius: BorderRadius.circular(InfiniteSize.buttonRadius),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: colorScheme.onSurfaceVariant, width: InfiniteSize.outlineWidth),
        borderRadius: BorderRadius.circular(InfiniteSize.buttonRadius),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorScheme.primary, width: InfiniteSize.outlineWidth * 2),
        borderRadius: BorderRadius.circular(InfiniteSize.buttonRadius),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorScheme.error, width: InfiniteSize.outlineWidth),
        borderRadius: BorderRadius.circular(InfiniteSize.buttonRadius),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorScheme.error, width: InfiniteSize.outlineWidth * 2),
        borderRadius: BorderRadius.circular(InfiniteSize.buttonRadius),
      ),
    );
