import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:privates/ui/extensions/num_extension.dart';

class Button extends StatelessWidget {
  final String text;
  final String? prefixIcon, suffixIcon;
  final Widget? prefix, suffix;
  final TextStyle? textStyle;
  final double? height, width;
  final Color? backgroundColor;
  final BoxBorder? border;
  final double borderRadius;
  final Size? prefixSize, suffixSize;
  final EdgeInsetsGeometry? padding, margin;
  final VoidCallback onPressed;

  const Button({
    super.key,
    required this.text,
    required this.borderRadius,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.prefix,
    required this.suffix,
    required this.textStyle,
    required this.height,
    required this.width,
    required this.prefixSize,
    required this.suffixSize,
    required this.padding,
    required this.margin,
    required this.onPressed,
    this.border,
    this.backgroundColor,
  });

  Widget? get startIcon =>
      prefix ??
      (prefixIcon != null
          ? SizedBox.fromSize(
              size: prefixSize,
              child: SvgPicture.asset(prefixIcon!),
            )
          : null);

  Widget? get endIcon =>
      suffix ??
      (suffixIcon != null
          ? SizedBox.fromSize(
              size: suffixSize,
              child: SvgPicture.asset(suffixIcon!),
            )
          : null);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: border,
        borderRadius: borderRadius.circularRadius,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onPressed,
          splashColor: Colors.transparent.withOpacity(.1),
          highlightColor: Colors.transparent.withOpacity(.1),
          borderRadius: borderRadius.circularRadius,
          child: Padding(
            padding: padding ?? EdgeInsets.zero,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (startIcon != null) ...[
                  startIcon!,
                  8.horizontalSpace,
                ],
                Text(
                  text,
                  style: textStyle,
                ),
                if (endIcon != null) ...[
                  8.horizontalSpace,
                  endIcon!,
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
