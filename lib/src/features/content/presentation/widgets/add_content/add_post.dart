import 'dart:io' show File;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' show basename;
import 'package:path_provider/path_provider.dart' show getApplicationDocumentsDirectory;

import '../../blocs/add_content/add_content_cubit.dart';

class AddPost extends StatelessWidget {
  const AddPost({super.key});

  static Future<File?> _handleVideoUpload() async {
    try {
      XFile? video = await ImagePicker().pickVideo(
        source: ImageSource.gallery,
      );
      if (video == null) {
        return null;
      }
      final directory = await getApplicationDocumentsDirectory();
      final fileName = basename(video.path);
      final savedVideo = await File(video.path).copy('${directory.path}/$fileName');
      return savedVideo;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have not selected a video yet! 🤔',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () async {
                await _handleVideoUpload().then((video) {
                  if (video != null) {
                    context.read<AddContentCubit>().videoChanged(video);
                  }
                });
              },
              child: const Text('Select a video'),
            ),
          ],
        ),
      ),
    );
  }
}
