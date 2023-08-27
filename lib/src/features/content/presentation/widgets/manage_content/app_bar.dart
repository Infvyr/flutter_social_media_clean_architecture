import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants/index.dart';

class ManageContentAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ManageContentAppBar({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        name,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      centerTitle: true,
      leading: BackButton(
        onPressed: () => context.goNamed(AppRoutes.feed.name),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.upload_rounded),
          tooltip: 'Upload a video',
          onPressed: () => context.goNamed(AppRoutes.addContent.name),
        ),
        IconButton(
          icon: const Icon(Icons.edit),
          tooltip: 'Edit profile',
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
