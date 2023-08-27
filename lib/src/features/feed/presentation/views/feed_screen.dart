import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/presentation/index.dart';
import '../blocs/feed/feed_bloc.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
      child: Scaffold(
        bottomNavigationBar: const CustomNavBar(),
        body: BlocBuilder<FeedBloc, FeedState>(
          builder: (_, state) {
            if (state is FeedLoadingState) {
              return const Center(
                /// TODO: Shimmer
                child: CircularProgressIndicator(),
              );
            } else if (state is FeedLoadedState) {
              return VideoPlayerList(posts: state.posts);
            } else {
              return const Center(
                child: Text('Something went wrong!'),
              );
            }
          },
        ),
      ),
    );
  }
}
