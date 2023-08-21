import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_media_with_clean_architecture/src/features/content/presentation/blocs/add_content/add_content_cubit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../shared/presentation/index.dart';

class AddContentScreen extends StatefulWidget {
  const AddContentScreen({super.key});

  @override
  State<AddContentScreen> createState() => _AddContentScreenState();
}

class _AddContentScreenState extends State<AddContentScreen> {
  Future<File?> handleVideoUpload() async {
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
    return BlocConsumer<AddContentCubit, AddContentState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Add content'),
            centerTitle: true,
            actions: [
              state.video != null
                  ? IconButton(
                      onPressed: () => context.read<AddContentCubit>().reset(),
                      icon: const Icon(Icons.restore_rounded),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          body: state.video == null
              ? Center(
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
                            await handleVideoUpload().then((video) {
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
                )
              : state.video != null
                  ? VideoPlayerItem(assetPath: state.video!.path)
                  : const Center(
                      child: Text('Something went wrong!'),
                    ),
        );
      },
    );
  }
}
