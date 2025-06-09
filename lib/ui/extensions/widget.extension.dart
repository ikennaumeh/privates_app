import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget get alignToCenter => Center(child: this);

  // Spacing methods
  Widget paddingHorizontal(double padding) => Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: this,
      );

  // More useful flex methods that take a child
  Flexible flexibleChild(int flex) => Flexible(flex: flex, child: this);
  Expanded expandedChild(int flex) => Expanded(flex: flex, child: this);
}
