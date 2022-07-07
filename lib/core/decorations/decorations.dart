import 'package:flutter/material.dart';
import 'package:privates_app/core/decorations/color_palette.dart';

class Decorations {
  static BoxShadow footerShadow = const BoxShadow(
      color: Palette.grey10,
      offset: Offset(0, -2),
      blurStyle: BlurStyle.outer,
      blurRadius: 6);

  static BoxShadow lowElevation = BoxShadow(
      color: Palette.black.withOpacity(0.04),
      offset: const Offset(0, 2),
      blurRadius: 4);
  static BoxShadow elevation4 = BoxShadow(
      blurRadius: 4,
      spreadRadius: 0,
      color: Palette.black.withOpacity(.04),
      offset: const Offset(0, 2));

  static BoxShadow elevation6 = BoxShadow(
    offset: const Offset(0, 4),
    color: Palette.black.withOpacity(.1),
    blurRadius: 6,
  );

  static BoxShadow footerBoxShadow = BoxShadow(
      offset: const Offset(0, -2),
      blurRadius: 10,
      spreadRadius: 0,
      color: Palette.black.withOpacity(.06));

  static Border topBorder = const Border(top: BorderSide(color: Palette.grey10));
  static Border rightBorder = const Border(right: BorderSide(color: Palette.grey10));
  static Border bottomBorder = const Border(bottom: BorderSide(color: Palette.grey10));
  static Border leftBorder = const Border(left: BorderSide(color: Palette.grey10));
}