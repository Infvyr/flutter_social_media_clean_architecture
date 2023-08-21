import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class AddContentScreen extends StatefulWidget {
  const AddContentScreen({super.key});

  @override
  State<AddContentScreen> createState() => _AddContentScreenState();
}

class _AddContentScreenState extends State<AddContentScreen> {
  Future<void> handleVideoUpload(BuildContext context) async {
    XFile? video = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
    );
    if (video == null) {
      return;
    }
    final directory = await getApplicationDocumentsDirectory();
    final fileName = basename(video.path);
    final savedVideo = await File(video.path).copy('${directory.path}/$fileName');

    if (await savedVideo.exists()) {
      if (context.mounted) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            const SnackBar(
              content: Text('Unfortunatly, this video has already been uploaded. Please select another video!'),
            ),
          );
      }
      return;
    } else {
      debugPrint('Video does not exist $savedVideo');
      // TODO: upload the video
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Content'),
      ),
      body: Center(
        child: FilledButton(
          onPressed: () async => await handleVideoUpload(context),
          child: const Text('Select video'),
        ),
      ),
    );
  }
}
