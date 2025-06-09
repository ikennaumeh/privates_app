import 'package:flutter/material.dart';

extension WidgetNumExtension on num {
  // Spacing
  SizedBox get verticalSpace => SizedBox(height: toDouble());
  SizedBox get horizontalSpace => SizedBox(width: toDouble());
  Spacer get spacer => Spacer(flex: toInt());

  // Padding
  EdgeInsets get paddingHorizontal =>
      EdgeInsets.symmetric(horizontal: toDouble());

  BorderRadius get circularRadius => BorderRadius.circular(toDouble());
}
