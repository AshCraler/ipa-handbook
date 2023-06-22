import 'package:flutter/material.dart';

const orange = Color(0xFFF9A61A);
const green = Color(0xFF28A65A);
const blue = Color(0xFF273C92);

CustomColors lightCustomColors = const CustomColors(
  sourceOrange: Color(0xFFF9A61A),
  orange: Color(0xFFF9A61A),
  onOrange: Color(0xFFFFFFFF),
  orangeContainer: Color(0xFFFFDDB5),
  onOrangeContainer: Color(0xFF2A1800),
  sourceGreen: Color(0xFF28A65A),
  green: Color(0xFF28A65A),
  onGreen: Color(0xFFFFFFFF),
  greenContainer: Color(0xFF84FBA4),
  onGreenContainer: Color(0xFF00210C),
  sourceBlue: Color(0xFF273C92),
  blue: Color(0xFF273C92),
  onBlue: Color(0xFFFFFFFF),
  blueContainer: Color(0xFFDDE1FF),
  onBlueContainer: Color(0xFF001356),
);

CustomColors darkCustomColors = const CustomColors(
  sourceOrange: Color(0xFFF9A61A),
  orange: Color(0xFFFFB957),
  onOrange: Color(0xFF462B00),
  orangeContainer: Color(0xFF643F00),
  onOrangeContainer: Color(0xFFFFDDB5),
  sourceGreen: Color(0xFF28A65A),
  green: Color(0xFF67DD8A),
  onGreen: Color(0xFF003919),
  greenContainer: Color(0xFF005227),
  onGreenContainer: Color(0xFF84FBA4),
  sourceBlue: Color(0xFF273C92),
  blue: Color(0xFFB9C3FF),
  onBlue: Color(0xFF0D267E),
  blueContainer: Color(0xFF2A3F95),
  onBlueContainer: Color(0xFFDDE1FF),
);

/// Defines a set of custom colors, each comprised of 4 complementary tones.
///
/// See also:
///   * <https://m3.material.io/styles/color/the-color-system/custom-colors>
@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.sourceOrange,
    required this.orange,
    required this.onOrange,
    required this.orangeContainer,
    required this.onOrangeContainer,
    required this.sourceGreen,
    required this.green,
    required this.onGreen,
    required this.greenContainer,
    required this.onGreenContainer,
    required this.sourceBlue,
    required this.blue,
    required this.onBlue,
    required this.blueContainer,
    required this.onBlueContainer,
  });

  final Color? sourceOrange;
  final Color? orange;
  final Color? onOrange;
  final Color? orangeContainer;
  final Color? onOrangeContainer;
  final Color? sourceGreen;
  final Color? green;
  final Color? onGreen;
  final Color? greenContainer;
  final Color? onGreenContainer;
  final Color? sourceBlue;
  final Color? blue;
  final Color? onBlue;
  final Color? blueContainer;
  final Color? onBlueContainer;

  @override
  CustomColors copyWith({
    Color? sourceOrange,
    Color? orange,
    Color? onOrange,
    Color? orangeContainer,
    Color? onOrangeContainer,
    Color? sourceRed,
    Color? red,
    Color? onRed,
    Color? redContainer,
    Color? onRedContainer,
    Color? sourceGreen,
    Color? green,
    Color? onGreen,
    Color? greenContainer,
    Color? onGreenContainer,
    Color? sourceBlue,
    Color? blue,
    Color? onBlue,
    Color? blueContainer,
    Color? onBlueContainer,
  }) {
    return CustomColors(
      sourceOrange: sourceOrange ?? this.sourceOrange,
      orange: orange ?? this.orange,
      onOrange: onOrange ?? this.onOrange,
      orangeContainer: orangeContainer ?? this.orangeContainer,
      onOrangeContainer: onOrangeContainer ?? this.onOrangeContainer,
      sourceGreen: sourceGreen ?? this.sourceGreen,
      green: green ?? this.green,
      onGreen: onGreen ?? this.onGreen,
      greenContainer: greenContainer ?? this.greenContainer,
      onGreenContainer: onGreenContainer ?? this.onGreenContainer,
      sourceBlue: sourceBlue ?? this.sourceBlue,
      blue: blue ?? this.blue,
      onBlue: onBlue ?? this.onBlue,
      blueContainer: blueContainer ?? this.blueContainer,
      onBlueContainer: onBlueContainer ?? this.onBlueContainer,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      sourceOrange: Color.lerp(sourceOrange, other.sourceOrange, t),
      orange: Color.lerp(orange, other.orange, t),
      onOrange: Color.lerp(onOrange, other.onOrange, t),
      orangeContainer: Color.lerp(orangeContainer, other.orangeContainer, t),
      onOrangeContainer: Color.lerp(onOrangeContainer, other.onOrangeContainer, t),
      sourceGreen: Color.lerp(sourceGreen, other.sourceGreen, t),
      green: Color.lerp(green, other.green, t),
      onGreen: Color.lerp(onGreen, other.onGreen, t),
      greenContainer: Color.lerp(greenContainer, other.greenContainer, t),
      onGreenContainer: Color.lerp(onGreenContainer, other.onGreenContainer, t),
      sourceBlue: Color.lerp(sourceBlue, other.sourceBlue, t),
      blue: Color.lerp(blue, other.blue, t),
      onBlue: Color.lerp(onBlue, other.onBlue, t),
      blueContainer: Color.lerp(blueContainer, other.blueContainer, t),
      onBlueContainer: Color.lerp(onBlueContainer, other.onBlueContainer, t),
    );
  }

  /// Returns an instance of [CustomColors] in which the following custom
  /// colors are harmonized with [dynamic]'s [ColorScheme.primary].
  ///
  /// See also:
  ///   * <https://m3.material.io/styles/color/the-color-system/custom-colors#harmonization>
  CustomColors harmonized(ColorScheme dynamic) {
    return copyWith();
  }
}
