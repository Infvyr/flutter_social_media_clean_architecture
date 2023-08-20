import 'package:flutter/material.dart';

import '../../../../../shared/domain/index.dart';

class DiscoverCardItem extends StatelessWidget {
  const DiscoverCardItem({
    super.key,
    required this.user,
    required this.index,
  });

  final User user;
  final int index;

  @override
  Widget build(BuildContext context) {
    final imageExist = user.avatarUrl != null || user.avatarUrl!.isNotEmpty;
    return Container(
      height: index.isEven ? 260 : 300,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(
          image: imageExist ? AssetImage(user.avatarUrl!) : const AssetImage('assets/images/image_1.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
