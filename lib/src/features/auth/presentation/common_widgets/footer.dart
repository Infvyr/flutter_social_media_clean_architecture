import 'package:flutter/gestures.dart' show TapGestureRecognizer;
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
    this.onTap,
    required this.mainText,
    required this.subText,
  });

  final VoidCallback? onTap;
  final String mainText;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: mainText),
          TextSpan(
            text: subText,
            style: Theme.of(context).textTheme.labelLarge,
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
