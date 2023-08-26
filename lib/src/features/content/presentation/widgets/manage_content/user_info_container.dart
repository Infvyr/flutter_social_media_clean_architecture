import 'package:flutter/material.dart';

import '../../../../../shared/domain/index.dart';
import '../../index.dart';

class UserInfoContainer extends StatelessWidget {
  const UserInfoContainer({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        UserInfoPanel(title: 'Followers', amount: user.followers.toString()),
        UserInfoPanel(title: 'Following', amount: user.followings.toString()),
      ],
    );
  }
}
