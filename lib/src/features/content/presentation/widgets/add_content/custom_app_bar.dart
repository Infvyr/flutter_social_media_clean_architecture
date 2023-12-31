import 'dart:io' show File;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants/index.dart';
import '../../blocs/add_content/add_content_cubit.dart';

class AddContentAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AddContentAppBar({
    super.key,
    required this.video,
  });

  final File? video;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Add a post'),
      centerTitle: true,
      actions: [
        video != null
            ? IconButton(
                onPressed: () => context.read<AddContentCubit>().reset(),
                icon: const Icon(Icons.restore_rounded),
              )
            : const SizedBox.shrink(),
      ],
      leading: BackButton(
        onPressed: () => context.goNamed(AppRoutes.feed.name),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
