import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/index.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      notchMargin: 10,
      child: SizedBox(
        height: 75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                context.goNamed(AppRoutes.feed.name);
              },
              icon: const Icon(Icons.home),
              iconSize: 30,
            ),
            IconButton(
              onPressed: () {
                context.goNamed(AppRoutes.discover.name);
              },
              icon: const Icon(Icons.search),
              iconSize: 30,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_circle),
              iconSize: 30,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.message),
              iconSize: 30,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person),
              iconSize: 30,
            ),
          ],
        ),
      ),
    );
  }
}
