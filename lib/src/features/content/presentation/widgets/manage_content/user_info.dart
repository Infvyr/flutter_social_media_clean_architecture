import 'package:flutter/material.dart';

import '../../../../auth/domain/entities/index.dart';
import '../../index.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key, required this.user});

  final LoggedInUser user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.grey,
          backgroundImage: user.avatarUrl == null ? null : AssetImage(user.avatarUrl!),
        ),
        const SizedBox(height: 20),
        UserInfoContainer(user: user),
      ],
    );
  }
}
