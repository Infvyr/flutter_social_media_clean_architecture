import 'package:flutter/material.dart';

class AddContentScreen extends StatelessWidget {
  const AddContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Content'),
      ),
      body: Center(
        child: FilledButton(
          onPressed: () {},
          child: const Text('Select video'),
        ),
      ),
    );
  }
}
