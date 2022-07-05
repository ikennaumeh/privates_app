import 'dart:math';

/// Proportionally scale vertical dimensions and fonts up and/or down depending
/// on a device's screen height
class DeviceScaler {
  double? deviceHeight;

  static final DeviceScaler _instance = DeviceScaler._privateConstructor();
  DeviceScaler._privateConstructor();

  factory DeviceScaler() => _instance;

  /// iPhone X height in pt is our reference
  static const double _referenceHeight = 812;

  /// [minSize] This is the least height dimension you don't want to go below
  /// [canScaleUp] Set to false if you don't want to scale above the [referenceSize]
  /// [referenceSize] The size dimension you want to scale up or/and down.
  double scale(double referenceSize, {double? minSize, bool? canScaleUp = true}) {
    if (deviceHeight == null) {
      return referenceSize;
    }

    double ratio = deviceHeight! / _referenceHeight;

    final scaledSize = (ratio * referenceSize)
        .ceilToDouble();


    if (canScaleUp != null && !canScaleUp && scaledSize > referenceSize) {
      return referenceSize;
    }

    if (minSize == null) {
      return scaledSize;
    }

    return max(minSize, scaledSize);
  }

  /// Font scaling is constrained to 11pt as the least size attainable
  /// Use this to scale fonts
  double scaleFont(double referenceSize, {bool? canScaleUp = true}) {
    return scale(referenceSize, minSize: 10, canScaleUp: canScaleUp);
  }
}
