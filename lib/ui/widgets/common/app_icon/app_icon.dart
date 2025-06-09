import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:privates/ui/common/app_icons.dart';
import 'package:privates/ui/extensions/context_extensions.dart';

class AppIcon extends StatelessWidget {
  final double height, borderRadius;
  final Color? backgroundColor, iconColor;
  final List<BoxShadow>? boxShadow;

  const AppIcon({
    super.key,
    required this.height,
    this.borderRadius = 0,
    this.backgroundColor,
    this.iconColor,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: AspectRatio(
        aspectRatio: 0.95,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: backgroundColor,
            boxShadow: boxShadow,
          ),
          child: SvgPicture.asset(
            kicArrowHeart,
            colorFilter: iconColor == null
                ? null
                : ColorFilter.mode(iconColor!, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
