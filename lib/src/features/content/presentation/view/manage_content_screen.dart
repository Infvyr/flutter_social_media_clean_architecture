import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/presentation/index.dart';
import '../../../auth/presentation/blocs/auth/auth_bloc.dart';
import '../blocs/manage_content/manage_content_bloc.dart';
import '../index.dart';

class ManageContentScreen extends StatelessWidget {
  const ManageContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthBloc>().state.user;

    return Scaffold(
      appBar: ManageContentAppBar(name: user.name.value),
      body: BlocBuilder<ManageContentBloc, ManageContentState>(
        builder: (context, state) {
          if (state is ManageContentLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ManageContentLoadedState) {
            return DefaultTabController(
              length: 2,
              child: NestedScrollView(
                headerSliverBuilder: (_, __) => [
                  SliverToBoxAdapter(child: UserInfoHeader(user: user)),
                ],
                body: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ManageUploadedVideos(posts: state.posts),
                    const Center(child: Text('Liked')),
                  ],
                ),
              ),
            );
          } else {
            return const AlertError();
          }
        },
      ),
    );
  }
}
