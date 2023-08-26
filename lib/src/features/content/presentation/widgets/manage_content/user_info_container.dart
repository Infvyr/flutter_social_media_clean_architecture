import 'package:flutter/material.dart';

import '../../../../auth/domain/entities/index.dart';
import '../../index.dart';

class UserInfoContainer extends StatelessWidget {
  const UserInfoContainer({super.key, required this.user});

  final LoggedInUser user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        UserInfoPanel(title: 'Followers', amount: '${user.followers}'),
        UserInfoPanel(title: 'Following', amount: '${user.followings}'),
      ],
    );
  }
}
