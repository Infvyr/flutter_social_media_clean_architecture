import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/index.dart';
import '../../../../shared/presentation/index.dart';
import '../../../feed/presentation/blocs/feed/feed_bloc.dart';
import '../blocs/add_content/add_content_cubit.dart';
import '../index.dart';

class AddContentScreen extends StatelessWidget {
  const AddContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddContentCubit, AddContentState>(
      listener: (context, state) {
        if (state.status == AddContentStatus.success) {
          context.read<FeedBloc>().add(GetFeedPostsEvent());
          context.goNamed(AppRoutes.feed.name);
        }
      },
      buildWhen: (previous, current) => previous.video != current.video,
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: AddContentAppBar(state: state),
          ),
          body: state.video == null
              ? const AddPost()
              : state.video != null
                  ? PostContent(state: state)
                  : const AlertError(),
        );
      },
    );
  }
}
