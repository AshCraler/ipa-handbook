import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../services/navigator_service.dart';

class InfiniteFontSize {
  const InfiniteFontSize._();

  static double get displayLarge => 57;
  static double get displayMedium => 45;
  static double get displaySmall => 36;

  static double get headlineLarge => 32;
  static double get headlineMedium => 28;
  static double get headlineSmall => 24;

  static double get titleLarge => 22;
  static double get titleMedium => 16;
  static double get titleSmall => 14;

  static double get priceSmall => 15;
  static double get priceMedium => 17;
  static double get priceLarge => 20;

  static double get bodyLarge => 17;
  static double get bodyMedium => 15;
  static double get bodySmall => 13;

  static double get labelLarge => 15;
  static double get labelMedium => 13;
  static double get labelSmall => 12;
}

class InfiniteSize {
  const InfiniteSize._();

  static double get buttonHeight => 48;
  static double get buttonMinWidth => 60;
  static double get buttonPadding => 12;
  static double get buttonRadius => 12;
  static double get chipPadding => 8;
  static double get chipRadius => 8;
  static double get textFieldRadius => 12;
  static double get textFieldPadding => 14;
  static double get cardRadius => 16;
  static double get dialogRadius => 20;
  static double get iconHeight => 36;

  static double get checkboxRadius => 2;
  static double get outlineWidth => 1;
  static double get sizeScale => isSmallScreen(context) ? 0.75 : 1.0;

  static BuildContext? get context => NavigationService.getBuildContext;

  static bool isSmallScreen(BuildContext? context) {
    double width = context != null
        ? MediaQuery.of(context).size.width
        // : WidgetsBinding.instance.window.physicalSize.width;
        : PlatformDispatcher.instance.views.first.physicalSize.width;
    return width < 380;
  }

  static double size(double size) => sizeScale * size;
  static double get mSize => sizeScale * spacing;
  static double get sSize => sizeScale * spacingS;
  static double get lSize => sizeScale * spacingL;

  ///padding
  static double get paddingXXS => spacingXXS;
  static double get paddingXS => spacingXS;
  static double get paddingS => spacingS;
  static double get padding => spacing;
  static double get paddingL => spacingL;
  static double get paddingXL => spacingXL;
  static double get paddingXXL => spacingXXL;

  ///spacing
  static double get spacingXXS => 4;
  static double get spacingXS => 8;
  static double get spacingS => 12;
  static double get spacing => 16;
  static double get spacingL => 20;
  static double get spacingXL => 24;
  static double get spacingXXL => 32;

  static double get appBarHeight => Platform.isAndroid ? kToolbarHeight : 50;

  //Halo invest
  static double get stepperStepLabelSize => 30.0;
}
