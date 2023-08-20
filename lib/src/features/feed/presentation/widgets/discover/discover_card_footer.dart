import 'package:flutter/material.dart';

import '../../../../../shared/domain/index.dart';

class DiscoverCardFooter extends StatelessWidget {
  const DiscoverCardFooter({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 10,
      child: Row(
        children: [
          CircleAvatar(
            radius: 14,
            backgroundImage: AssetImage(user.avatarUrl!),
          ),
          const SizedBox(width: 5),
          Text(
            user.name.value,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
