import 'package:flutter/material.dart';

import '../../../../auth/domain/entities/index.dart';
import '../../index.dart';

class UserInfoHeader extends StatelessWidget {
  const UserInfoHeader({super.key, required this.user});

  final LoggedInUser user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserInfo(user: user),
        const SizedBox(height: 20),
        TabBar(
          dividerColor: Colors.transparent,
          enableFeedback: true,
          indicatorColor: Theme.of(context).colorScheme.secondary,
          indicatorSize: TabBarIndicatorSize.tab,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          tabs: const [
            Tab(icon: Icon(Icons.grid_on)),
            Tab(icon: Icon(Icons.favorite)),
          ],
        ),
      ],
    );
  }
}
