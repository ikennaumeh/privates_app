import 'dart:ui';

class StartupModel {
  final String text, image;
  final bool showHeart;
  final Offset scribbleOffset;

  const StartupModel({
    required this.text,
    required this.image,
    required this.showHeart,
    required this.scribbleOffset,
  });
}
