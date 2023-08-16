import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants/index.dart';
import '../../index.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  static void onTap(BuildContext context) => context.goNamed(AppRoutes.signup.name);

  @override
  Widget build(BuildContext context) {
    return Footer(
      onTap: () => onTap(context),
      mainText: "Don't have an account? ",
      subText: 'Sign up',
    );
  }
}
