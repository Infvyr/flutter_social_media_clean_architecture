import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/presentation/blocs/auth/auth_bloc.dart';
import '../index.dart';

class ManageContentScreen extends StatelessWidget {
  const ManageContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthBloc>().state.user;

    return ScaffoldMessenger(
      child: Scaffold(
        appBar: ManageContentAppBar(name: user.name.value),
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (_, __) => [
              SliverToBoxAdapter(child: UserInfoHeader(user: user)),
            ],
            body: const TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                ManageUploadedVideos(),
                Center(child: Text('Liked')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
