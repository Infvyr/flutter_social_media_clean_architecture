import 'package:flutter/material.dart';
import 'package:flutter_social_media_with_clean_architecture/src/features/content/presentation/index.dart';

import '../../../../../shared/domain/index.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key, required this.user});

  final User user;

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
