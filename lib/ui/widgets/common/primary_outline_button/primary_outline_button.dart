import 'package:flutter/material.dart';
import 'package:privates/ui/extensions/context_extensions.dart';
import 'package:privates/ui/widgets/common/button/button.dart';

class PrimaryOutlineButton extends StatelessWidget {
  final String text;
  final double borderWidth, height, width;
  final String? prefixIcon, suffixIcon;
  final Widget? prefix, suffix;
  final TextStyle? textStyle;
  final Color? borderColor;
  final double borderRadius;
  final Size? prefixSize, suffixSize;
  final EdgeInsetsGeometry? padding, margin;
  final VoidCallback onPressed;

  const PrimaryOutlineButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.borderWidth = 1,
    this.prefixIcon,
    this.suffixIcon,
    this.prefix,
    this.suffix,
    this.textStyle,
    this.height = 56,
    this.width = double.maxFinite,
    this.borderColor,
    this.borderRadius = 0,
    this.prefixSize,
    this.suffixSize,
    this.padding,
    this.margin,
  });

  const PrimaryOutlineButton.widget({
    super.key,
    required this.text,
    required this.onPressed,
    this.borderWidth = 1,
    this.prefix,
    this.suffix,
    this.textStyle,
    this.height = 56,
    this.width = double.maxFinite,
    this.borderColor,
    this.borderRadius = 0,
    this.padding,
    this.margin,
  })  : prefixIcon = null,
        suffixIcon = null,
        prefixSize = null,
        suffixSize = null;

  const PrimaryOutlineButton.icon({
    super.key,
    required this.text,
    required this.onPressed,
    this.borderWidth = 1,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixSize,
    this.suffixSize,
    this.textStyle,
    this.height = 56,
    this.width = double.maxFinite,
    this.borderColor,
    this.borderRadius = 0,
    this.padding,
    this.margin,
  })  : prefix = null,
        suffix = null;

  @override
  Widget build(BuildContext context) {
    return Button(
      text: text,
      onPressed: onPressed,
      textStyle: textStyle ?? context.textTheme.bodyMedium,
      border: Border.all(
        color: context.dividerColor,
        width: borderWidth,
      ),
      borderRadius: borderRadius,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      prefix: prefix,
      suffix: suffix,
      height: height,
      width: width,
      prefixSize: prefixSize,
      suffixSize: suffixSize,
      padding: padding,
      margin: margin,
    );
  }
}
