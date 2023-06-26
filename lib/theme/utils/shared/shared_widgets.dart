import 'package:flutter/material.dart';

import '../sizes/sizes.dart';

class InfiniteSpacing {
  /// size 4
  static SizedBox get xxSmall => SizedBox.square(
        dimension: InfiniteSize.spacingXXS * InfiniteSize.sizeScale,
      );

  /// size 8
  static SizedBox get xSmall => SizedBox.square(
        dimension: InfiniteSize.spacingXS * InfiniteSize.sizeScale,
      );

  /// size 12
  static SizedBox get small => SizedBox.square(
        dimension: InfiniteSize.spacingS * InfiniteSize.sizeScale,
      );

  /// size 16
  static SizedBox get normal =>
      SizedBox.square(dimension: InfiniteSize.spacing * InfiniteSize.sizeScale);

  /// size 20
  static SizedBox get large => SizedBox.square(
        dimension: InfiniteSize.spacingL * InfiniteSize.sizeScale,
      );

  /// size 24
  static SizedBox get xLarge => SizedBox.square(
        dimension: InfiniteSize.spacingXL * InfiniteSize.sizeScale,
      );

  /// size 32
  static SizedBox get xxLarge => SizedBox.square(
      dimension: InfiniteSize.spacingXXL * InfiniteSize.sizeScale);
}

class InfiniteDivider {
  static Divider get horizontal => const Divider(
        height: 1,
      );

  static Divider get large => Divider(
        height: InfiniteSize.spacingXL * InfiniteSize.sizeScale,
      );

  static Divider get withPadding => Divider(
        height: 1,
        indent: InfiniteSize.padding * InfiniteSize.sizeScale,
        endIndent: InfiniteSize.padding * InfiniteSize.sizeScale,
      );

  static Divider custom({
    required double padding,
    double? height,
  }) =>
      Divider(
        height: height ?? 1,
        indent: padding * InfiniteSize.sizeScale,
        endIndent: padding * InfiniteSize.sizeScale,
      );

  static VerticalDivider get vertical => const VerticalDivider(
        width: 1,
      );
}

class InfinitePadding {
  static EdgeInsets get all =>
      EdgeInsets.all(InfiniteSize.padding * InfiniteSize.sizeScale);

  static EdgeInsets get horizontal => EdgeInsets.symmetric(
      horizontal: InfiniteSize.padding * InfiniteSize.sizeScale);

  static EdgeInsets get vertical => EdgeInsets.symmetric(
      vertical: InfiniteSize.padding * InfiniteSize.sizeScale);

  static EdgeInsets get top =>
      EdgeInsets.only(top: InfiniteSize.padding * InfiniteSize.sizeScale);

  static EdgeInsets get bottom =>
      EdgeInsets.only(bottom: InfiniteSize.padding * InfiniteSize.sizeScale);

  static EdgeInsets get left =>
      EdgeInsets.only(left: InfiniteSize.padding * InfiniteSize.sizeScale);

  static EdgeInsets get right =>
      EdgeInsets.only(right: InfiniteSize.padding * InfiniteSize.sizeScale);

  static EdgeInsets get noTop =>
      EdgeInsets.all(InfiniteSize.padding * InfiniteSize.sizeScale)
          .copyWith(top: 0);

  static EdgeInsets get noBottom =>
      EdgeInsets.all(InfiniteSize.padding * InfiniteSize.sizeScale)
          .copyWith(bottom: 0);

  static EdgeInsets get noLeft =>
      EdgeInsets.all(InfiniteSize.padding * InfiniteSize.sizeScale)
          .copyWith(left: 0);

  static EdgeInsets get noRight =>
      EdgeInsets.all(InfiniteSize.padding * InfiniteSize.sizeScale)
          .copyWith(right: 0);

  static EdgeInsets paddingAll(double size) =>
      EdgeInsets.all(size * InfiniteSize.sizeScale);

  static EdgeInsets paddingHorizontal(double size) =>
      EdgeInsets.symmetric(horizontal: size * InfiniteSize.sizeScale);

  static EdgeInsets paddingVertical(double size) =>
      EdgeInsets.symmetric(vertical: size * InfiniteSize.sizeScale);

  static EdgeInsets paddingSymmetric(double h, double v) =>
      EdgeInsets.symmetric(
          horizontal: h * InfiniteSize.sizeScale,
          vertical: v * InfiniteSize.sizeScale);

  static EdgeInsets paddingTop(double size) =>
      EdgeInsets.only(top: size * InfiniteSize.sizeScale);

  static EdgeInsets paddingBottom(double size) =>
      EdgeInsets.only(bottom: size * InfiniteSize.sizeScale);

  static EdgeInsets paddingLeft(double size) =>
      EdgeInsets.only(left: size * InfiniteSize.sizeScale);

  static EdgeInsets paddingRight(double size) =>
      EdgeInsets.only(right: size * InfiniteSize.sizeScale);

  static EdgeInsets paddingNoTop(double size) =>
      EdgeInsets.all(size * InfiniteSize.sizeScale).copyWith(top: 0);

  static EdgeInsets paddingNoBottom(double size) =>
      EdgeInsets.all(size * InfiniteSize.sizeScale).copyWith(bottom: 0);

  static EdgeInsets paddingNoLeft(double size) =>
      EdgeInsets.all(size * InfiniteSize.sizeScale).copyWith(left: 0);

  static EdgeInsets paddingNoRight(double size) =>
      EdgeInsets.all(size * InfiniteSize.sizeScale).copyWith(right: 0);

  static EdgeInsets custom({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      EdgeInsets.only(
          left: left * InfiniteSize.sizeScale,
          right: right * InfiniteSize.sizeScale,
          top: top * InfiniteSize.sizeScale,
          bottom: bottom * InfiniteSize.sizeScale);
}

class InfiniteShape {
  static get cardShape => RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(InfiniteSize.cardRadius));

  static get bottomSheetShape => RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(InfiniteSize.dialogRadius)),
      );

  static get zeroBorderShape =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(0));
}

class InfiniteShadow {
  static get boxShadowTop => [
        BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            offset: const Offset(0, -1))
      ];

  static get boxShadow => [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 4,
        )
      ];
}
