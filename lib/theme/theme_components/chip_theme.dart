part of 'theme_component.dart';

ChipThemeData haloChipTheme(ColorScheme colorScheme) => ChipThemeData(
      elevation: 0,
      pressElevation: 0,
      labelStyle: infiniTextTheme(colorScheme)
          .labelLarge
          ?.copyWith(color: colorScheme.onSecondaryContainer),
      labelPadding: EdgeInsets.symmetric(horizontal: InfiniteSize.chipPadding),
      padding: EdgeInsets.symmetric(
          horizontal: InfiniteSize.chipPadding,
          vertical: InfiniteSize.chipPadding),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(InfiniteSize.chipRadius),
      ),
      side: MaterialStateBorderSide.resolveWith(((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return const BorderSide(color: Colors.transparent);
        }
        if (states.contains(MaterialState.disabled)) {
          return BorderSide(color: colorScheme.disableColor);
        }
        return BorderSide(color: colorScheme.outline);
      })),
    );
