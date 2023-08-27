import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/presentation/index.dart';
import '../blocs/discover/discover_bloc.dart';
import '../index.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomNavBar(),
      body: BlocBuilder<DiscoverBloc, DiscoverState>(
        builder: (_, state) {
          if (state is DiscoverLoadingState) {
            return const Center(
              /// TODO: Shimmer
              child: CircularProgressIndicator(),
            );
          } else if (state is DiscoverLoadedState) {
            return DiscoverCardGrid(users: state.users);
          } else {
            return const Center(
              child: Text('Something went wrong!'),
            );
          }
        },
      ),
    );
  }
}
