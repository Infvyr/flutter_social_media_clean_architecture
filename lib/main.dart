import 'package:flutter/material.dart';

import 'src/config/index.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.theme(),
      routerConfig: AppRouter().router,
    );
  }
}
