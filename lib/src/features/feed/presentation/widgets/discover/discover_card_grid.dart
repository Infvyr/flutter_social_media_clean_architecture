import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../../shared/domain/index.dart';
import '../../../../../shared/presentation/index.dart';
import '../../index.dart';

class DiscoverCardGrid extends StatelessWidget {
  const DiscoverCardGrid({super.key, required this.users});

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        padding: const EdgeInsets.all(10),
        itemCount: users.length,
        itemBuilder: (_, index) => Stack(
          children: [
            DiscoverCardItem(user: users[index], index: index),
            const CustomGradientOverlay(decorationBorderRadius: 10),
            DiscoverCardFooter(user: users[index]),
          ],
        ),
      ),
    );
  }
}
