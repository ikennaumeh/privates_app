import 'package:flutter/material.dart';
import 'package:privates_app/core/decorations/color_pallete.dart';
import 'package:privates_app/core/decorations/device_scaler.dart';

class PrimaryButton extends StatelessWidget {
  final ButtonConfig buttonConfig;
  final double height;
  final EdgeInsets? margin;
  final double width;
  final Color color;

  const PrimaryButton(
      {Key? key,
        required this.buttonConfig,
        this.height = 60.0,
        this.margin,
        this.width = double.infinity,
        this.color = Palette.primary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin ?? const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: buttonConfig.disabled ? Palette.hintLightGrey : color,
        borderRadius: BorderRadius.circular(80),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: buttonConfig.disabled ? null : buttonConfig.action,
          borderRadius: BorderRadius.circular(80),
          highlightColor: Palette.primary.withOpacity(0.3),
          child: Center(
            child: Text(
              buttonConfig.text.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Palette.white,
                  letterSpacing: 1.3,
                  fontSize: DeviceScaler().scaleFont(24)),
            ),
          ),
        ),
      ),
    );
  }
}

class PrimaryBorderButton extends StatelessWidget {
  final ButtonConfig buttonConfig;
  final double height;
  final EdgeInsets? margin;
  final double width;
  final Color color;

  const PrimaryBorderButton(
      {Key? key,
        required this.buttonConfig,
        this.height = 60.0,
        this.margin,
        this.width = double.infinity,
        this.color = Palette.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin ?? const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: buttonConfig.disabled ? Palette.hintLightGrey : color,
        borderRadius: BorderRadius.circular(80),
        border: Border.all(color: Palette.primary, width: 2),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: buttonConfig.disabled ? null : buttonConfig.action,
          borderRadius: BorderRadius.circular(80),
          highlightColor: Palette.primary.withOpacity(0.3),
          child: Center(
            child: Text(
              buttonConfig.text.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Palette.primary,
                  letterSpacing: 1.3,
                  fontSize: DeviceScaler().scaleFont(24)),
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonConfig {
  final String text;
  final VoidCallback action;
  final bool disabled;

  ButtonConfig(
      {required this.text, required this.action, this.disabled = false});
}
