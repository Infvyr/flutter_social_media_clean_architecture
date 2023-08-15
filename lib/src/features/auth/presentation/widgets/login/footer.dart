import 'package:flutter/gestures.dart' show TapGestureRecognizer;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants/index.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(text: "Don't have an account? "),
          TextSpan(
            text: 'Sign up',
            style: Theme.of(context).textTheme.labelLarge,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.goNamed(AppRoutes.signup.name);
              },
          ),
        ],
      ),
    );
  }
}
