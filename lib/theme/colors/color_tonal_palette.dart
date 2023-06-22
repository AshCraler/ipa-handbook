import 'package:flutter/material.dart';

class ColorTonalPalette extends ColorSwatch<int> {
  const ColorTonalPalette(int primary, Map<int, Color> swatch) : super(primary, swatch);
  get commonTones => [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 95, 99, 100];
  Color get color100 => this[100]!;
  Color get color99 => this[99]!;
  Color get color95 => this[95]!;
  Color get color90 => this[90]!;
  Color get color80 => this[80]!;
  Color get color70 => this[70]!;
  Color get color60 => this[60]!;
  Color get color50 => this[50]!;
  Color get color40 => this[40]!;
  Color get color30 => this[30]!;
  Color get color20 => this[20]!;
  Color get color10 => this[10]!;
  Color get color0 => this[0]!;
}
