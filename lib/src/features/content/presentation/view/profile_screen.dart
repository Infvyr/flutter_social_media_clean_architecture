import 'package:flutter/material.dart';
import 'package:flutter_social_media_with_clean_architecture/src/shared/presentation/index.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/index.dart';
import '../../../../shared/domain/index.dart';
import '../index.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// TODO: Get the current logged in user
    User user = const User(
      id: 'user.id.value',
      name: Username.dirty('Jane Doep'),
      avatarUrl: 'assets/images/image_4.jpg',
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          user.name.value,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.upload_rounded),
            tooltip: 'Upload a video',
            onPressed: () {
              context.goNamed(AppRoutes.addContent.name);
            },
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: 'Edit profile',
            onPressed: () {},
          ),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (_, __) => [
            SliverToBoxAdapter(
              child: UserInfoHeader(user: user),
            ),
          ],
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              GridView.builder(
                key: const PageStorageKey('profile_grid_view'),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 9 / 16,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 9,
                itemBuilder: (context, index) {
                  final post = Post(
                    id: '1',
                    user: user,
                    caption: 'Test Caption',
                    assetPath: 'assets/videos/video_1.mp4',
                  );

                  return VideoPlayerItem(
                    assetPath: post.assetPath,
                    key: ValueKey(post.id),
                  );
                },
              ),
              const Center(child: Text('Liked')),
            ],
          ),
        ),
      ),
    );
  }
}
