import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants/index.dart';
import '../../index.dart';

class SignupFooter extends StatelessWidget {
  const SignupFooter({super.key});

  static void onTap(BuildContext context) => context.goNamed(AppRoutes.login.name);

  @override
  Widget build(BuildContext context) {
    return Footer(
      onTap: () => onTap(context),
      mainText: 'Already have an account? ',
      subText: 'Sign in',
    );
  }
}
