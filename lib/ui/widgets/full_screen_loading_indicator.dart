import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:privates_app/core/decorations/color_palette.dart';

class FullScreenProgressIndicator extends StatelessWidget {
  const FullScreenProgressIndicator()
      : super(key: const Key('FullScreenBusyIndicator'));

  @override
  Widget build(BuildContext context) {
    const spinKit = SpinKitSpinningLines(
      color: Palette.primary,
      size: 60.0,
    );
    return Material(
      color: Palette.transparent,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          color: Palette.white,
          alignment: Alignment.center,
          child: const Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 100,
              width: 100,
              child: spinKit,
            ),
          ),
        ),
      ),
    );
  }
}