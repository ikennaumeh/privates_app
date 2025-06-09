import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class StylingLocalizations extends StatelessWidget {
  /// The full localized text.
  final String localizedText;

  /// The substrings to style.
  final List<String> textToStyle;

  /// Callbacks for each styled substring.
  final List<VoidCallback> styledTextCallbacks;

  /// Style for non-styled text.
  final TextStyle? generalStyle;

  /// Style for the styled substrings.
  final TextStyle? styledTextStyle;

  /// Text alignment.
  final TextAlign? textAlign;

  /// Overflow handling.
  final TextOverflow? overflow;

  /// Max number of lines.
  final int? maxLines;

  const StylingLocalizations({
    super.key,
    required this.localizedText,
    required this.textToStyle,
    this.styledTextCallbacks = const [],
    this.generalStyle,
    this.styledTextStyle,
    this.textAlign,
    this.overflow,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    final List<TextSpan> spans = [];
    int currentIndex = 0;

    while (currentIndex < localizedText.length) {
      int nextOccurrence = localizedText.length;
      String? matchedText;

      for (final styledText in textToStyle) {
        final index = localizedText.indexOf(styledText, currentIndex);
        if (index != -1 && index < nextOccurrence) {
          nextOccurrence = index;
          matchedText = styledText;
        }
      }

      // Add regular (unstyled) text before the next match
      if (currentIndex < nextOccurrence) {
        spans.add(TextSpan(
          text: localizedText.substring(currentIndex, nextOccurrence),
          style: generalStyle,
        ));
      }

      if (matchedText != null) {
        final matchIndex = textToStyle.indexOf(matchedText);
        final callback = (matchIndex >= 0 && matchIndex < styledTextCallbacks.length)
            ? styledTextCallbacks[matchIndex]
            : null;

        spans.add(TextSpan(
          text: matchedText,
          style: styledTextStyle,
          recognizer: callback != null
              ? (TapGestureRecognizer()..onTap = callback)
              : null,
        ));

        currentIndex = nextOccurrence + matchedText.length;
      } else {
        break; // No more styled matches
      }
    }

    return Text.rich(
      TextSpan(children: spans),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}