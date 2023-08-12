import 'package:flutter/material.dart';

import '../../../../shared/presentation/custom_nav_bar.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed screen'),
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
