part of 'theme_component.dart';

CheckboxThemeData haloCheckboxTheme(ColorScheme colorScheme) =>
    CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(InfiniteSize.checkboxRadius),
      ),
      fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return colorScheme.disableColor;
        }
        if (states.contains(MaterialState.selected)) {
          return colorScheme.primary;
        }
        return Colors.transparent;
      }),
      checkColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return colorScheme.disableTextColor;
        }
        if (states.contains(MaterialState.selected)) {
          return colorScheme.onPrimary;
        }
        return Colors.transparent;
      }),
      side: MaterialStateBorderSide.resolveWith(((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return const BorderSide(width: 2, color: Colors.transparent);
        }
        if (states.contains(MaterialState.disabled)) {
          return BorderSide(width: 2, color: colorScheme.disableColor);
        }
        return BorderSide(width: 2, color: colorScheme.outline);
      })),
    );
