import 'package:flutter/material.dart';

class UserInfoPanel extends StatelessWidget {
  const UserInfoPanel({
    super.key,
    required this.title,
    required this.amount,
  });

  final String title;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          amount,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                letterSpacing: 1.2,
              ),
        ),
      ],
    );
  }
}
