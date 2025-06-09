import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ThemeData get _theme => Theme.of(this);

  double useHeightPercent(double size) =>
      MediaQuery.sizeOf(this).height * (size / 100);

  double get getHeight => MediaQuery.sizeOf(this).height;

  double useWidthPercent(double size) =>
      MediaQuery.sizeOf(this).width * (size / 100);

  double get getWidth => MediaQuery.sizeOf(this).width;

  TextTheme get textTheme => _theme.textTheme;

  ColorScheme get colorScheme => _theme.colorScheme;

  Color get dividerColor => _theme.dividerColor;

  bool get isKeyboardVisible => MediaQuery.viewInsetsOf(this).bottom > 0;
}
