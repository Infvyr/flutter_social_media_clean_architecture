import 'package:flutter/material.dart';

import '../../../../../shared/presentation/index.dart';
import '../../../../auth/domain/entities/index.dart';
import '../../index.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key, required this.user});

  final LoggedInUser user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Avatar(avatarUrl: user.avatarUrl),
        const SizedBox(height: 20),
        UserInfoContainer(user: user),
      ],
    );
  }
}
